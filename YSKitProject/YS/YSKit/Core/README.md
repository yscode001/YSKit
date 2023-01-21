# YSKit/Core 核心组件协议
主要包括：

1. 扩展对象协议
2. codable协议扩展
3. then协议扩展
4. 通知Notification协议封装
5. 用户偏好设置UserDefaults协议封装
6. 钥匙串KeyChain协议封装

## 扩展对象协议
对Any、AnyObject进行扩展的封装，使“原始对象”的扩展的调用具备统一的调用入口。

主要包括： 

- YSCoreProtocol(核心组件协议)

  遵守此协议使对象具有"ys"属性(只读属性，每次使用会重新创建)

- YSOriginalObjectProtocol(原始对象协议)
  
  扩展此协议，给原始对象添加扩展属性或方法，调用：originalObject.ys.extensionMethod

下面我们通过一个自定义类，来介绍这2个协议如果使用

~~~ swift
// 1、遵守协议YSCoreProtocol，类和对象就有了"ys"属性
class Dog: YSCoreProtocol{
    
    var name = "辛巴"
}

// 2、对原始对象类型进行约束，扩展里面的方法就可以通过：obj.ys.xxx进行调用
// 扩展里面，通过originalObject获取原始对象
// where OriginalObjectType: Dog，Dog本类及子类都可以使用
// where OriginalObjectType = Dog，只有Dog本类可以使用，子类不可以使用
extension YSOriginalObjectProtocol where OriginalObjectType: Dog{
    
    func eat(){
        // originalObject：原始对象，即dog对象
        print("我叫\(originalObject.name)，我正在吃饭")
    }
    
    @discardableResult func changeName(newName: String) -> OriginalObjectType{
        // originalObject：原始对象，即dog对象
        originalObject.name = newName
        print("我改名字了，我的新名字是：\(originalObject.name)")
        return originalObject
    }
    
    static func customStaticMethod(){
        print("这是扩展的静态的方法")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 3、创建对象，通过ys属性调用其扩展方法
        let dog = Dog()
        Dog.ys.customStaticMethod() // 这是扩展的静态的方法
        dog.ys.eat() // 我叫辛巴，我正在吃饭
        dog.ys.changeName(newName: "大黄") // 我改名字了，我的新名字是：大黄
    }
}
~~~

## codable 协议扩展
对象遵守YSCoreProtocol、Codable，那么便拥有以下能力：

1. 序列化 obj -> data
2. 反序列化 data/dictionary/jsonString -> obj
3. 反序列化 data/dictionary/jsonString -> objList

下面我们通过一个具体的示例来进行说明
~~~ swift
// 遵守协议YSCoreProtocol、Codable
class Dog: YSCoreProtocol, Codable{
    
    var name = "辛巴"
    
    init() {
        name = "辛巴"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dog1 = Dog()
        let dog2 = Dog()
        let dogList = [dog1, dog2]
        
        // 序列化"对象"为"data"
        let data = dog1.ys.serialize()
        
        // 反序列化 -> 对象
        let dog3 = Dog.ys.deserialize(data: data!)
        let dog4 = Dog.ys.deserialize(jsonString: "{\"name\": \"大黄\"}")
        let dog5 = Dog.ys.deserialize(jsonString: "{\"name\": \"大黄\"}", encoding: .utf8)
        let dog6 = Dog.ys.deserialize(dict: ["name": "大黄"])
        
        // 序列化"对象数组"为"data"
        let data2 = dogList.ys.serialize()
        
        // 反序列化 -> 对象数组
        let dogList1 = Dog.ys.deserializeList(data: data2!)
        let dogList2 = Dog.ys.deserializeList(jsonString: "[{\"name\": \"大黄\"}, {\"name\": \"哈雷\"}]")
        let dogList3 = Dog.ys.deserializeList(jsonString: "[{\"name\": \"大黄\"}, {\"name\": \"哈雷\"}]", encoding: .utf8)
        let dogList4 = Dog.ys.deserializeList(dictList: [["name": "大黄"], ["name": "哈雷"]])
    }
}
~~~

## then、with、do方法实现

遵守了YSCoreProtocol协议后，默认便拥有了then、with、do方法的实现，同样，通过"ys"属性进行调用：
- obj.ys.with   
- obj.ys.do   
- obj.ys.then

我们直接看这3个方法即可，非常简单，这里不再做说明
~~~ swift
extension YSOriginalObjectProtocol where OriginalObjectType: Any {

    @inlinable
    public func with(_ block: (inout OriginalObjectType) throws -> Void) rethrows -> OriginalObjectType {
        var copy = originalObject
        try block(&copy)
        return copy
    }

    @inlinable
    public func `do`(_ block: (OriginalObjectType) throws -> Void) rethrows {
        try block(originalObject)
    }
}

extension YSOriginalObjectProtocol where OriginalObjectType: AnyObject {

    @inlinable
    public func then(_ block: (OriginalObjectType) throws -> Void) rethrows -> OriginalObjectType {
        try block(originalObject)
        return originalObject
    }
}
~~~

使用示例
~~~ swift
// 遵守协议YSCoreProtocol
class Dog: YSCoreProtocol{
    
    var name = "辛巴"
    
    init() {
        name = "辛巴"
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dog = Dog()
        let _ = dog.ys.with{ $0.name = "大黄" }
        let _ = dog.ys.then{ $0.name = "哈雷" }
        dog.ys.do{ $0.name = "狗子" }
    }
}
~~~

## 通知Notification协议封装

我们知道，notification一般都很离散，不易管理。如果一个应用中到处滥用notification，那将是灾难性的存在。可读性、可维护性、可扩展性将会变得极其艰难。所以我们需要对notification进行统一管理。

这里，我们定义了一个协议“YSNotificationProtocol”。在应用中使用的时候，可以定义一个枚举来管理notification名称，遵守这个协议，仅仅需要提供一个get的属性即可。然后便可方便使用。

下面我们看一下示例代码：
~~~ swift
/// 通知管理器，记得务必遵守YSNotificationProtocol协议
enum YSNotification: String, YSNotificationProtocol{
    
    /// 更新当前用户的年龄，userinfo=["age": Int]
    case updateCurrentUserAge
    
    /// 协议里面定义的通知名称
    var notificationName: String{
        /// 返回当前值得字符串
        return rawValue
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 静态方法管理通知
        YSNotification.ys.post(<#T##notification: Notification##Notification#>)
        YSNotification.ys.add(observer: <#T##Any#>, selector: <#T##Selector#>, notiNameList: <#T##[NSNotification.Name]#>, object: <#T##Any?#>)
        YSNotification.ys.add(observer: <#T##Any#>, selector: <#T##Selector#>, notificationNameList: <#T##[YSNotification]#>, object: <#T##Any?#>)
        
        // MARK: - 对象方法自定义通知的发送与监听(通知名是当前枚举值得原始值)
        YSNotification.updateCurrentUserAge.ys.post()
        YSNotification.updateCurrentUserAge.ys.post(object: <#T##Any?#>, userInfo: <#T##[AnyHashable : Any]?#>)
        YSNotification.updateCurrentUserAge.ys.add(observer: <#T##Any#>, selector: <#T##Selector#>, object: <#T##Any?#>)
    }
}
~~~

## 用户偏好设置UserDefaults协议封装
和通知一样，UserDefaults也属于离散数据，最好统一管理起来。

同样，我们定义了一个协议“YSUserDefaultsProtocol”。。在应用中使用的时候，可以定义一个枚举来管理UserDefaults的key，遵守这个协议，仅仅需要提供一个get的属性即可。然后便可方便使用。

下面我们看一下示例代码：
~~~ swift
/// UserDefaults管理器，记得务必遵守YSUserDefaultsProtocol协议
enum YSUserDefaults: String, YSUserDefaultsProtocol{
    
    /// 当前用户的username，value=String
    case currentUsername
    
    /// 协议里面定义的key名称
    var userDefaultKey: String{
        /// 返回当前值得字符串
        return rawValue
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 所有方法调用，obj.ys.xxx
        
        // MARK: - 是否设置过当前key
        YSUserDefaults.currentUsername.ys.existCurrentKey
        
        // MARK: - 赋值，方法都是set，这里只示例一种，智能提示可以全部出来
        YSUserDefaults.currentUsername.ys.set(<#T##value: Any##Any#>)
        
        // MARK: - 取值，方法都是get，这里只示例一种，智能提示可以全部出来
        YSUserDefaults.currentUsername.ys.getString()
    }
}
~~~

## 钥匙串KeyChain协议封装
与Notification和UserDefaults一样，我们也定义了一个KeyChain的管理协议“YSKeyChainProtocol”。用法稍有不同，但大同小异，这里不再做重复的讲解，我们直接看示例代码，然后照虎画猫即可。
~~~ swift
/// 自定义KeyChain管理器
enum YSKeyChain: String, YSKeyChainProtocol{
    
    // MARK: - 属性
    
    /// 自定义的设备ID，value=String
    case deviceID
    
    var service: String{
        return "xx.xxxx.xxxxxx"
    }
    
    var account: String{
        return rawValue
    }
    
    var existCurrentAccount: Bool{
        // 这里需要自己做判断
        return true
    }
    
    // MARK: - 方法
    
    func set(value: String) {
        // 赋值，需要自己实现
    }
    
    func getValue() -> String? {
        // 取值，需要自己实现
        return nil
    }
    
    func delete() {
        // 删除，需要自己实现
    }
}

/// 给KeyChain管理器添加ys方法，便于统一调用，减少记忆成本
extension YSOriginalObjectProtocol where OriginalObjectType == YSKeyChain{
    
    var existCurrentAccount: Bool{
        return originalObject.existCurrentAccount
    }
    
    func set(value: String) {
        originalObject.set(value: value)
    }
    
    func getValue() -> String? {
        return originalObject.getValue()
    }
    
    func delete() {
        originalObject.delete()
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 使用自定义KeyChain管理器
        YSKeyChain.deviceID.ys.existCurrentAccount
        YSKeyChain.deviceID.ys.set(value: <#T##String#>)
        YSKeyChain.deviceID.ys.getValue()
        YSKeyChain.deviceID.ys.delete()
    }
}
~~~

## 默认遵守
以下类默认遵守了YSCoreProtocol，直接导入”YSKit/Core“即可使用
~~~ swift
extension YSCoreProtocol where Self: Any { }
extension YSCoreProtocol where Self: AnyObject { }

extension NSObject: YSCoreProtocol {}
extension Array: YSCoreProtocol {}
extension Dictionary: YSCoreProtocol {}
extension Set: YSCoreProtocol {}

#if !os(Linux)
extension CGPoint: YSCoreProtocol {}
extension CGRect: YSCoreProtocol {}
extension CGSize: YSCoreProtocol {}
extension CGVector: YSCoreProtocol {}
#endif

#if os(iOS) || os(tvOS)
extension URL: YSCoreProtocol{}
extension UIEdgeInsets: YSCoreProtocol {}
extension UIOffset: YSCoreProtocol {}
extension UIRectEdge: YSCoreProtocol {}
extension Int: YSCoreProtocol {}
extension Float: YSCoreProtocol {}
extension CGFloat: YSCoreProtocol {}
extension Double: YSCoreProtocol {}
extension Date: YSCoreProtocol {}
extension String: YSCoreProtocol {}
#endif
~~~