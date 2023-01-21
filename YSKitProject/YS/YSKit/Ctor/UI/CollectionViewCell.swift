//
//  CollectionViewCell.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func colvCell(_ colv: UICollectionView, _ indexPath: IndexPath, _ identifier: String) -> UICollectionViewCell{
        return colv.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    /// 注意，一定要保证注册了identifier = "EmptyCellID"
    static func colvCel_empty(_ colv: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell{
        return colv.dequeueReusableCell(withReuseIdentifier: EmptyCellID, for: indexPath)
    }
    
    static func colvHeader(_ colv: UICollectionView, _ indexPath: IndexPath, _ identifier: String) -> UICollectionReusableView{
        return colv.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath)
    }
    
    static func colvFooter(_ colv: UICollectionView, _ indexPath: IndexPath, _ identifier: String) -> UICollectionReusableView{
        return colv.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath)
    }
}
