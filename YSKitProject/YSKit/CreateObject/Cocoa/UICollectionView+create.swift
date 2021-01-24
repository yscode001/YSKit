//
//  UICollectionView+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

// MARK: - 创建UICollectionView
public extension YSOriginalObjectProtocol where OriginalObjectType == UICollectionView{
    
    static func create(bgc: UIColor, frame: CGRect, layout: UICollectionViewFlowLayout) -> OriginalObjectType{
        return UICollectionView(frame: frame, collectionViewLayout: layout).ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            $0.register(YSEmptyColvCell.self, forCellWithReuseIdentifier: YSEmptyCellID)
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func create(bgc: UIColor, frame: CGRect, layout: UICollectionViewFlowLayout, cells: [String: AnyClass]) -> OriginalObjectType{
        return UICollectionView(frame: frame, collectionViewLayout: layout).ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            $0.register(YSEmptyColvCell.self, forCellWithReuseIdentifier: YSEmptyCellID)
            for item in cells{
                $0.register(item.value, forCellWithReuseIdentifier: item.key)
            }
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func create(bgc: UIColor, frame: CGRect, layout: UICollectionViewFlowLayout, cells: [String: AnyClass], dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) -> OriginalObjectType{
        return UICollectionView(frame: frame, collectionViewLayout: layout).ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            $0.register(YSEmptyColvCell.self, forCellWithReuseIdentifier: YSEmptyCellID)
            for item in cells{
                $0.register(item.value, forCellWithReuseIdentifier: item.key)
            }
            $0.dataSource = dataSource
            $0.delegate = delegate
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
}

// MARK: - 创建UICollectionViewCell
public extension YSOriginalObjectProtocol where OriginalObjectType == UICollectionView{
    
    static func createCell(_ colv: UICollectionView, _ indexPath: IndexPath, _ identifier: String) -> UICollectionViewCell{
        return colv.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    /// 注意，一定要保证注册了identifier = "YSEmptyCellID"
    static func createCel_empty(_ colv: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell{
        return colv.dequeueReusableCell(withReuseIdentifier: YSEmptyCellID, for: indexPath)
    }
    
    static func createHeader(_ colv: UICollectionView, _ indexPath: IndexPath, _ identifier: String) -> UICollectionReusableView{
        return colv.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath)
    }
    
    static func createFooter(_ colv: UICollectionView, _ indexPath: IndexPath, _ identifier: String) -> UICollectionReusableView{
        return colv.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath)
    }
}
