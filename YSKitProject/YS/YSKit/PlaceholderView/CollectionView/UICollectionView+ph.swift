//
//  UICollectionView+ph.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/24.
//

private extension UICollectionView{
    
    /// UICollectionView是否有内容
    /// - Returns: UICollectionView是否有内容
    func hasItems() -> Bool{
        for section in 0..<self.numberOfSections{
            if self.numberOfItems(inSection: section) > 0{
                return true
            }
        }
        return false
    }
}

// MARK: - 决定placeholderView是否显示
public extension YSOriginalProtocol where OriginalType: UICollectionView{
    
    /// 如果无数据显示某种类型的placeholderView，有数据隐藏所有的placeholderView
    func placeholder_show_ifHasNoData(type: YSPlaceholderEnum){
        DispatchQueue.main.async { [weak originalObj] in
            guard let originalView = originalObj else{ return }
            if originalView.hasItems(){
                placeholder_hide()
            } else{
                placeholder_show(type: type)
            }
        }
    }
}
