//
//  CollectionView.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func colv(bgColor: UIColor, frame: CGRect, layout: UICollectionViewFlowLayout) -> UICollectionView{
        return UICollectionView(frame: frame, collectionViewLayout: layout).ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            $0.register(EmptyColvCell.self, forCellWithReuseIdentifier: EmptyCellID)
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func colv(bgColor: UIColor, frame: CGRect, layout: UICollectionViewFlowLayout, cells: [String: AnyClass]) -> UICollectionView{
        return UICollectionView(frame: frame, collectionViewLayout: layout).ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            $0.register(EmptyColvCell.self, forCellWithReuseIdentifier: EmptyCellID)
            for item in cells{
                $0.register(item.value, forCellWithReuseIdentifier: item.key)
            }
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
        }
    }
    
    static func colv(bgColor: UIColor, frame: CGRect, layout: UICollectionViewFlowLayout, cells: [String: AnyClass], dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) -> UICollectionView{
        return UICollectionView(frame: frame, collectionViewLayout: layout).ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            $0.register(EmptyColvCell.self, forCellWithReuseIdentifier: EmptyCellID)
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
