# Foundation常用扩展
- 值类型扩展
~~~swift
// Int、Float、CGFloat、Double扩展
// 范围取值(这里以Int为例，Float、CGFloat、Double都是一样的)：
3.ys.rangeVal(2, 10) // 2，10分别为最大值、最小值
/********end********/

// CGSize扩展
// width或height 小于等于(<=) 0
let isEmpty = view.bounds.size.ys.isEmpty
/********end********/

// Array扩展
// remove和delete等价
[1, 2, 3].remove(fromSubscript: 2)
[1, 2, 3].delete(fromSubscript: 2)
        
// 是否包含某个下标，常用于做数组越界判断
[1, 2, 3].contains(subscript: 2)
        
// 数组去重
[1, 2, 3].filterDuplicates{ $0 }
~~~

- Date(日期类型)扩展
~~~ swift
// 日期计算
let d = Date()
let d1 = d.ys.addYear(1)
let d2 = d.ys.addMonth(1)
let d3 = d.ys.addDay(1)
let d4 = d.ys.addHour(1)
let d5 = d.ys.addMinute(1)
let d6 = d.ys.addSecond(1)
let d7 = d.ys.add(year: 1, month: 1, day: 1, hour: 1, minute: 1, second: 1)
        
// 重置日期的时分秒
let d8 = d.ys.reset(hour: 1, minute: 1, second: 1)
        
// 日期组成部分
let coms = d.ys.components()
        
// Date与String转换
let str = d.ys.string("yyyy-MM-dd")
let d9 = str.ys.date("yyyy-MM-dd")
        
// 日期开始与结束
let d10 = d.ys.start_year()
let d11 = d.ys.start_month()
let d12 = d.ys.start_day()
let d13 = d.ys.end_year()
let d14 = d.ys.end_month()
let d15 = d.ys.end_day()
        
// 天数
let c1 = d.ys.dayCount_thisMonth() // 日期所在月份的天数
let c2 = d.ys.dayCount(date: d2) // 2个日期隔的天数
        
// 日期比较
let b1 = d.ys.isToday()
let b2 = d.ys.isYesterday()
let b3 = d.ys.isTomorrow()
        
let b4 = d.ys.isInSameYear(d2)
let b5 = d.ys.isInSameMonth(d2)
let b6 = d.ys.isSameDay(d2)
let b7 = d.ys.isNextDay(d2)
let b8 = d.ys.isPriorDay(d2)
~~~

- String扩展
~~~ swift
// 路径
let p1 = String.ys.sandbox_home
let p2 = String.ys.sandbox_cache
let p3 = String.ys.sandbox_library
let p4 = String.ys.sandbox_document
let p5 = String.ys.sandbox_tmp

// 格式转换
let str = "10"
let nsstr = str.ys.nsstring
let att = str.ys.attributedString
let att2 = str.ys.attributedString(attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
let muatt = str.ys.mutableAttributedString
let muatt2 = str.ys.mutableAttributedString(attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
let boolVal = str.ys.bool
let intVal = str.ys.int
let floatVal = str.ys.float
let cgfloatVal = str.ys.cgFloat
let doubleVal = str.ys.double

// 获取子串range
let r1 = str.ys.range(subString: "a")
let r2 = str.ys.rangeList(subString: "a")

// base64编解码
let encode = str.ys.base64Encode()
let decode = str.ys.base64Decode()
        
// 正则匹配
let b1 = str.ys.regularExpression("a")
        
// URL与参数操作(https://www.baidu.com/?userName=xiaoming)
str.ys.url_

// 国际化
let str2 = str.ys.local...

// 常规操作
let _ = str.ys.removeFirstString("a")
let _ = str.ys.removeLastCharacter()
let _ = str.ys.replaceFirstString(old: "a", new: "b")
let _ = str.ys.trim_startAndEnd()
let _ = str.ys.trim_all()
let _ = str.ys.substring(10, showMore: true)
let _ = str.ys.size(attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
let _ = str.ys.isEmptyOrWhiteSpace // 是否是空字符串或全是空格
~~~

- NSString扩展
~~~ swift
// 格式转换
let nsstr = NSString()
let str = nsstr.ys.string
let att = nsstr.ys.attributedString
let att2 = nsstr.ys.attributedString(attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
let muatt = nsstr.ys.mutableAttributedString
let muatt2 = nsstr.ys.mutableAttributedString(attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        
// 路径
let p1 = NSString.ys.sandbox_home
let p2 = NSString.ys.sandbox_document
let p3 = NSString.ys.sandbox_tmp
let p4 = NSString.ys.sandbox_cache
let p5 = NSString.ys.sandbox_library
        
// 获取子串range
let r1 = nsstr.ys.range(subString: "a")
let r2 = nsstr.ys.rangeList(subString: "a")
~~~

- NSMutableAttributedString(富文本)扩展
~~~ swift
// 富文本操作
let muatt = NSMutableAttributedString(string: "a")
muatt.ys.addAttributes(...)
~~~

# UNUserNotificationCenter(LocalPush)常用扩展
~~~ swift
// 取消已预定的本地推送
UNUserNotificationCenter.ys.removeLocalNotifications(["identifier"])
        
// 预定本地推送
UNUserNotificationCenter.ys.pendingLocalNotification(identifier: "identifier", title: "你好", body: "到吃饭时间点了", userinfo: ["userName": "小名"], fireDate: Date())
~~~

# UIKit常用扩展
~~~ swift
// 提供了以下类的扩展
// UIView
// UIScrollView
// UITableView
// UICollectionView
// UIImage
// UIScreen
// UISwitch
// UIApplication

// 都很简单，不再一一列举用法
// 使用：obj.ys.xxx
~~~

# UIViewController常用扩展
~~~ swift
// push与pop
UIViewController().ys.push(UIViewController(), animated: true)
UIViewController().ys.pop(animated: true)
UIViewController().ys.popToVC(UIViewController(), animated: true)
UIViewController().ys.popToRootVC(animated: true)
        
// 弹框
UIViewController().ys.alert(title: "title", message: "message", actions: [UIAlertAction]())
UIViewController().ys.actionSheet(title: "title", message: "message", actions: [UIAlertAction]())
        
// 添加子控制器
UIViewController().ys.addChildVC(UIViewController(), intoView: self.view)
UIViewController().ys.addChildVCList([UIViewController()], intoView: self.view)

// 取控制器的类名
let className = UIViewController().ys.className

// UITabBarController添加子视图，常用作全局弹框
UITabBarController().ys.tabBarCAddSubview(UIView(), selectedIdx: 2)
~~~

# WKWebView常用扩展
~~~ swift
// 设置横向、竖向的滚动条是否显示
WKWebView().ys.setIndicator(false, false)
        
// 加载网页
WKWebView().ys.load("https://www.baidu.com", cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
~~~
