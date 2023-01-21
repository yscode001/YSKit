# YSKit/Database：数据库管理

  对CoreData的封装，使用CoreData管理本地数据库。
~~~swift
/// 主线程
let m = CoreDataManager.shared.mainContext
        
/// 后台线程
let o = CoreDataManager.shared.operateContext
        
/// 应用启动后进行注册
CoreDataManager.shared.ys.registerAfterLaunching(dbFileName: "dbFileName")
        
/// 保存
CoreDataManager.shared.ys.save(o)
        
/// 回滚
CoreDataManager.shared.ys.roolback(o)
~~~