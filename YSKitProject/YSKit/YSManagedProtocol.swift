//
//  YSManagedProtocol.swift
//  YSKit
//
//  Created by 姚帅 on 2021/3/11.
//

import Foundation
import CoreData

public protocol YSManagedProtocol: class, NSFetchRequestResult {
    
    /// 实体描述
    static var entity: NSEntityDescription { get }
    
    /// 实体模型的名字
    static var entityName: String { get }
    
    /// 默认排序
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
    
    /// 默认谓词
    static var defaultPredicate: NSPredicate { get }
}

public extension YSManagedProtocol{
    
    /// 默认排序
    static var defaultSortDescriptors: [NSSortDescriptor] { return [] }
    
    /// 默认谓词
    static var defaultPredicate: NSPredicate { return NSPredicate(value: true) }
    
    /// 使用"默认排序"和"默认谓词"的获取请求
    static var fetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        request.predicate = defaultPredicate
        return request
    }
    
    /// 创建获取请求
    static func fetchRequest(sorts: [NSSortDescriptor], predicate: NSPredicate) -> NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = sorts
        request.predicate = predicate
        return request
    }
    
    /// 创建谓词
    static func predicate(format: String, args: CVarArg...) -> NSPredicate {
        return NSPredicate(format: format, args)
    }
}

public extension YSManagedProtocol where Self: NSManagedObject {
    
    /// 实体描述
    static var entity: NSEntityDescription { return entity()  }
    
    /// 实体模型的名字
    static var entityName: String { return entity.name ?? "" }
    
    /// 生成新的ManagedObject
    static func insertObject(context: NSManagedObjectContext) -> Self?{
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as? Self
    }
    
    /// 仅从已经实体化(registeredObjects)的对象集合中查找
    static func materialized(context: NSManagedObjectContext, predicate: NSPredicate) -> [Self]? {
        var resultList:[Self]?
        for object in context.registeredObjects {
            guard let result = object as? Self, predicate.evaluate(with: result) else {
                continue
            }
            if resultList == nil{
                resultList = [Self]()
            }
            resultList?.append(result)
        }
        return resultList
    }
    
    /// 从数据库中查找
    static func fetch(context: NSManagedObjectContext, configure: ((NSFetchRequest<Self>) -> ()), complete: @escaping(([Self]?) -> ())){
        let request = NSFetchRequest<Self>(entityName: Self.entityName)
        configure(request)
        context.perform({
            complete(try? context.fetch(request))
        })
    }
    
    /// 优先registeredObjects，其次数据库
    static func materializedOrFetch(context: NSManagedObjectContext, configure: (NSFetchRequest<Self>) -> () = { _ in }, complete: @escaping(([Self]?) -> ())){
        let request = NSFetchRequest<Self>(entityName: Self.entityName)
        configure(request)
        guard let predicate = request.predicate else{
            complete(nil)
            return
        }
        guard let objectList = materialized(context: context, predicate: predicate) else{
            fetch(context: context, configure: configure, complete: complete)
            return
        }
        complete(objectList)
    }
    
    /// 从数据库查找符合条件的个数
    static func count(context: NSManagedObjectContext, configure: ((NSFetchRequest<Self>) -> ()), complete: @escaping((Int?) -> ())){
        let request = NSFetchRequest<Self>(entityName: entityName)
        configure(request)
        if request.resultType != .countResultType{
            request.resultType = .countResultType
        }
        context.perform({
            complete(try? context.count(for: request))
        })
    }
}
