# YSKit/PlaceholderView 占位视图
开发中我们一般有这样的需求。

1. 网络请求时，显示一个"loading"的占位视图
2. 网络请求失败是，显示一个"出错"的占位视图
3. TableView、CollectionView没有数据时，显示一个"空数据"的占位视图
4. 某些View，需要登录才能查看，需要显示一个"登录"的占位视图

我们这个组件就是为了解决这样的需求而存在的。

## 使用步骤
1. 声明一个占位视图，遵守YSPlaceholderProtocol协议
2. 实现协议中定义的一个只读属性和一个方法
3. 将占位视图添加到内容视图的身上(添加之后默认是隐藏的)
4. 由内容视图来控制占位视图是否显示

提示：所有方法前缀："obj.ys.placeholder_" 开头

## 示例代码
下面我们直接通过示例代码来展示
~~~ swift
// MARK: - 1、自定义占位视图，遵守YSPlaceholderProtocol协议

/// 1、自定义占位视图，遵守YSPlaceholderProtocol协议
class PlaceholderLabel: UILabel, YSPlaceholderProtocol {
    
    /// 协议属性：提供占位视图的类型
    var placeholderType: YSPlaceholderType{
        return .empty
    }
    
    /// 占位视图隐藏与显示状态切换后，会自定调用此方法
    func doSomeThingAfter(show: Bool) {
        let tips = show ? "显示placeholderView" : "隐藏placeholderView"
        print(tips)
    }
    
    convenience init(tips: String){
        self.init()
        self.text = tips
        self.textAlignment = .center
    }
}

class ViewController: UIViewController {
    
    // MARK: - 2、定义内容视图与占位视图
    
    private lazy var placeholderLbl:PlaceholderLabel = PlaceholderLabel(tips: "没有相关的数据")
    private lazy var contentView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .orange
        contentView.frame = view.bounds
        view.addSubview(contentView)
        
        // MARK: - 3、将占位视图添加至内容视图
        // 这两种方法等价
        contentView.ys.placeholder_add(placeholderLbl)
        // placeholderLbl.ys.placeholder_addedToSuperView(superV: contentView)
    }
    
    // MARK: - 4、内容视图控制占位视图是否显示
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if placeholderLbl.isHidden{
            contentView.ys.placeholder_show(type: .empty)
            
            // UITableView、UICollectionView有以下额外方法供调用
            // UITableView().ys.placeholder_show_ifHasData(type: .empty)
            // UICollectionView().ys.placeholder_show_ifHasData(type: .empty)
        } else{
            contentView.ys.placeholder_hide()
        }
    }
}

~~~

## 注意
如果placeholderView是添加给ScrollView，一定要等其布局完成后再决定显示隐藏。
~~~ swift
override func viewDidLoad() {
	super.viewDidLoad()
	setupUI()
	bindVM()
        
	// 放到这里不起作用，因为scrollView还没有布局好
	// tbv.ys.placeholder_show(type: .empty)
}
    
override func viewDidLayoutSubviews() {
	super.viewDidLayoutSubviews()
        
	// scrollView布局好了，这里才起作用
	tbv.ys.placeholder_show(type: .empty)
}
~~~