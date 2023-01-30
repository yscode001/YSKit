//
//  UICollectionView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import UIKit

public extension YSOriginalProtocol where OriginalType: UICollectionView{
    
    @discardableResult func dataSource_delegate(_ dataSource: UICollectionViewDataSource?, _ delegate: UICollectionViewDelegate?) -> OriginalType{
        originalObj.dataSource = dataSource
        originalObj.delegate = delegate
        return originalObj
    }
    
    @discardableResult func register(_ cells: [String: AnyClass]) -> OriginalType{
        for item in cells{
            originalObj.register(item.value, forCellWithReuseIdentifier: item.key)
        }
        return originalObj
    }
    
    @discardableResult func register_sectionHeader(_ headers: [String: AnyClass]) -> OriginalType{
        for item in headers{
            originalObj.register(item.value, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: item.key)
        }
        return originalObj
    }
    
    @discardableResult func register_sectionFooter(_ footers: [String: AnyClass]) -> OriginalType{
        for item in footers{
            originalObj.register(item.value, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: item.key)
        }
        return originalObj
    }
}

// MARK: - 重加载和删除的加固处理
public extension YSOriginalProtocol where OriginalType: UICollectionView{
    
    /// 判断是多secion还是单section
    var isMultiSections:Bool{
        return originalObj.numberOfSections > 1
    }
    
    /// 删除，已加各种判断，外界直接使用
    func deleteItem(at: IndexPath){
        DispatchQueue.main.async { [weak originalObj] in
            guard let colv = originalObj else{ return }
            if at.section < 0 || at.item < 0 || colv.numberOfSections <= 0{
                return
            }
            let lastSection = colv.numberOfSections - 1
            if lastSection < at.section{
                return
            }
            if colv.numberOfItems(inSection: at.section) <= 0{
                return
            }
            let lastItem = colv.numberOfItems(inSection: at.section) - 1
            if lastItem < at.item{
                return
            }
            guard let _ = colv.indexPathsForVisibleItems.firstIndex(of: at) else{
                return
            }
            colv.deleteItems(at: [at])
        }
    }
    
    /// 删除，已加各种判断，外界直接使用
    func deleteItems(at: [IndexPath]){
        for indexp in at{
            deleteItem(at: indexp)
        }
    }
    
    /// 重新加载，已加各种判断，外界直接使用
    func reloadItem(at: IndexPath){
        DispatchQueue.main.async { [weak originalObj] in
            guard let colv = originalObj else{ return }
            if at.section < 0 || at.item < 0 || colv.numberOfSections <= 0{
                return
            }
            let lastSection = colv.numberOfSections - 1
            if lastSection < at.section{
                return
            }
            if colv.numberOfItems(inSection: at.section) <= 0{
                return
            }
            let lastItem = colv.numberOfItems(inSection: at.section) - 1
            if lastItem < at.item{
                return
            }
            guard let _ = colv.indexPathsForVisibleItems.firstIndex(of: at) else{
                return
            }
            colv.reloadItems(at: [at])
        }
    }
    
    /// 重新加载，已加各种判断，外界直接使用
    func reloadItems(at: [IndexPath]){
        for indexp in at{
            reloadItem(at: indexp)
        }
    }
    
    func reloadData(complete: @escaping() -> Void){
        UIView.animate(withDuration: 0, animations: {
            originalObj.reloadData()
        }, completion: { _ in
            complete()
        })
    }
}
