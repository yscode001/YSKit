# YSVendor(基于常用三方库的二次封装)

## 钥匙串(SAMKeychain)
- 扩展Key
```
extension KeyChain.Account{
    
    /// 设备ID
    static let DeviceID: KeyChain.Account = KeyChain.Account("DeviceID")
    
    /// App的第一次安装时间
    static let FirstInstallDateTime: KeyChain.Account = KeyChain.Account("FirstInstallDateTime")
}
```
- 使用
```
// 指定key是否存在
let exist: Bool = KeyChain.exist(account: .DeviceID)

// 设置指定key的value
KeyChain.setValue(account: .DeviceID, value: "xxx")

// 获取指定key的value
KeyChain.getValue(account: .DeviceID)
KeyChain.getValue(account: .DeviceID, default: "xx")

// 删除指定key
KeyChain.delete(account: .DeviceID)
```
## 网络图片(SDWebImage)
```
// 设置网络图片
UIImageView().ys.setImage(...)
```
## 刷新控件(MJRefresh)
```
class VC: BaseVC{
    
    private lazy var tbv:UITableView = Ctor.tbv(bgColor: .white, frame: .zero, style: .plain)
    
    private lazy var refreshCtrl: YSRefreshCtrl = Ctor.refreshCtrl(pulldown: {
        print("下拉刷新执行的闭包")
    }, pullup: {
        print("上拉加载执行的闭包")
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 把刷新控件设置给tableView，以下2种方式等价
        tbv.ys.setupRefreshCtrl(ctrl: refreshCtrl)
        refreshCtrl.ys.setupToTableView(tbv: tbv)
        
        // 自动刷新
        refreshCtrl.ys.autoPulldownRefresh()
        
        // 是否正在执行刷新和加载动作
        let _ = refreshCtrl.ys.isPulldownRefreshing
        let _ = refreshCtrl.ys.isPullupRefreshing
        
        // 结束刷新
        refreshCtrl.ys.endRefresh(pulldown: true, hasMore: true)
        
        // 设置标题数据
        refreshCtrl.ys.setupData(title: <#T##YSRefreshTitleInfo#>)
    }
}
```
