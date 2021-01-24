//
//  CoreDataManager.swift
//  TCIosBaseProject
//
//  Created by 姚帅 on 2020/12/4.
//

import Foundation
import CoreData

/// CoreData工具类
public class CoreDataManager: YSCoreProtocol{
    
    /// 私有化构造函数
    private init(){}
    
    /// CoreData单例管理
    public static let shared:CoreDataManager = CoreDataManager()
    
    /// 数据库文件名字
    fileprivate lazy var dbFileName:String = "cn.ys.yskit"
    
    /// 持久化容器
    private lazy var persistentContainer:NSPersistentContainer = {
        let model = NSManagedObjectModel.mergedModel(from: nil) ?? NSManagedObjectModel()
        let container = NSPersistentContainer(name: self.dbFileName, managedObjectModel: model)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let err = error{
                print(String(format: "CoreData 打开／新建数据库出现错误：%@", arguments: [err.localizedDescription]))
            }
        })
        return container
    }()
    
    // MARK: - 3个上下文提交数据顺序：operateContext -> mainContext -> saveingContext
    
    /// 操作对象上下文privateQueueConcurrencyType
    public private(set) lazy var operateContext:NSManagedObjectContext = {
        let context = self.persistentContainer.newBackgroundContext()
        context.parent = self.mainContext
        return context
    }()
    
    /// 管理对象上下文mainQueueConcurrencyType
    public private(set) lazy var mainContext:NSManagedObjectContext = {
        let context = self.persistentContainer.viewContext
        context.parent = self.saveingContext
        return context
    }()
    
    /// 保存对象上下文privateQueueConcurrencyType
    fileprivate lazy var saveingContext:NSManagedObjectContext = self.persistentContainer.newBackgroundContext()
}

// MARK: - 持久化
public extension YSOriginalObjectProtocol where OriginalObjectType == CoreDataManager{
    
    /// 应用启动后注册数据库文件名称
    func registerAfterLaunching(dbFileName: String){
        if dbFileName.ys.isEmptyOrWhiteSpace{
            return
        }
        originalObject.dbFileName = dbFileName
    }
    
    /// 保存
    func save(_ context: NSManagedObjectContext) {
        if context != originalObject.operateContext && context != originalObject.mainContext && context != originalObject.saveingContext{
            print("CoreData 上下文使用错误，不能保存数据")
            return
        }
        if !context.hasChanges{
            print("CoreData context 没有变化，不用持久化")
            return
        }
        context.perform({
            if let parentContent = context.parent{ // 有上级context，接着提交
                do {
                    try context.save()
                    self.save(parentContent)
                } catch {
                    print(String(format: "CoreData 数据保存失败：%@", arguments: [error.localizedDescription]))
                }
            } else{ // 自己就是顶级context，加锁持久化
                objc_sync_enter(self)
                do {
                    try context.save()
                } catch {
                    print(String(format: "CoreData 数据保存失败：%@", arguments: [error.localizedDescription]))
                }
                objc_sync_exit(self)
            }
        })
    }
    
    /// 回滚
    func roolback(_ context: NSManagedObjectContext){
        context.rollback()
    }
}
