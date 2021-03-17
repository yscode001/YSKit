//
//  CoreDataManager.swift
//  YSKit
//
//  Created by 姚帅 on 2021/3/11.
//

import Foundation
import CoreData

/// CoreData管理器
public class CoreDataManager{
    
    /// 私有化构造函数
    private init(){}
    
    /// CoreData单例管理
    public static let shared:CoreDataManager = CoreDataManager()
    
    /// 数据库文件名字
    private lazy var dbFileName:String = "cn.ys.coredata.db"
    
    // MARK: - CoreDataStack
    
    // MARK: - 持久化存储调度器
    private var _psc:NSPersistentStoreCoordinator?
    private var psc:NSPersistentStoreCoordinator?{
        if _psc != nil{
            return _psc
        }
        objc_sync_enter(self)
        // 使用所有的管理对象模型
        guard let mom = NSManagedObjectModel.mergedModel(from: nil) else {
            objc_sync_exit(self)
            return nil
        }
        // 数据库文件存储路径
        guard let cacheDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last else {
            objc_sync_exit(self)
            return nil
        }
        let dbPath = (cacheDir as NSString).appendingPathComponent(dbFileName)
        let dbURL = URL(fileURLWithPath: dbPath)
        do{
            // 初始化"持久化存储协调器"
            _psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
            // 添加持久化存储，使用Sqlite进行存储，并且自动合并修改的表结构以及数据库结构
            let opt = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
            try _psc?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: dbURL, options: opt)
        }
        catch{
            _psc = nil
        }
        objc_sync_exit(self)
        return _psc
    }
    
    // MARK: - 管理对象上下文
    private var _saveingMoc:NSManagedObjectContext?
    private var saveingMoc:NSManagedObjectContext?{
        if let moc = _saveingMoc{
            return moc
        }
        guard let ps = psc else {
            return nil
        }
        _saveingMoc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        _saveingMoc?.persistentStoreCoordinator = ps
        return _saveingMoc
    }
    
    private var _mainMoc:NSManagedObjectContext?
    
    /// 主队列moc，parent是一个拥有psc的私有队列moc
    public  var mainMoc:NSManagedObjectContext?{
        if let moc = _mainMoc{
            return moc
        }
        guard let saveMoc = saveingMoc else{
            return nil
        }
        _mainMoc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        _mainMoc?.parent = saveMoc
        return _mainMoc
    }
    
    private var _backgroundMoc:NSManagedObjectContext?
    
    /// 私有队列moc，parent为mainMoc
    public var backgroundMoc:NSManagedObjectContext?{
        if let moc = _backgroundMoc{
            return moc
        }
        guard let maiMoc = mainMoc else {
            return nil
        }
        _backgroundMoc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        _backgroundMoc?.parent = maiMoc
        return _backgroundMoc
    }
}

// MARK: - 持久化
extension CoreDataManager{
    
    private func innerSave(moc: NSManagedObjectContext){
        if !moc.hasChanges{
            print("CoreData 管理对象上下文 没有变化，不需要持久化")
            return
        }
        moc.perform({
            // 异步执行保存操作
            if let parentMoc = moc.parent{ // 有parentMoc，接着提交
                do {
                    try moc.save()
                    self.innerSave(moc: parentMoc)
                } catch {
                    print(String(format: "CoreData 数据保存失败：%@", arguments: [error.localizedDescription]))
                }
            } else{ // 自己是rootMoc，加锁持久化(其实Apple已经使用psc加过锁了，这里只是为了更保险一些)
                objc_sync_enter(self)
                do {
                    try moc.save()
                } catch {
                    print(String(format: "CoreData 数据保存失败：%@", arguments: [error.localizedDescription]))
                }
                objc_sync_exit(self)
            }
        })
    }
    
    /// 持久化
    /// - Parameter mainMoc: 使用mainMoc或者backgroundMoc进行持久化
    public func save(isMainMoc: Bool){
        guard let moc = (isMainMoc ? mainMoc : backgroundMoc) else{
            print("CoreData 管理对象上下文不存在，不能保存数据")
            return
        }
        innerSave(moc: moc)
    }
}

// MARK: - 回滚
extension CoreDataManager{
    
    /// 回滚
    public func roolback(isMainMoc: Bool){
        guard let moc = (isMainMoc ? mainMoc : backgroundMoc) else{
            print("CoreData 管理对象上下文不存在，不能回滚")
            return
        }
        moc.rollback()
    }
}
