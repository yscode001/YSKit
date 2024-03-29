//
//  UITableView+ph.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/24.
//

private extension UITableView{
    
    /// UITableView是否有内容
    /// - Returns: UITableView是否有内容
    func hasRows() -> Bool{
        for section in 0..<self.numberOfSections{
            if self.numberOfRows(inSection: section) > 0{
                return true
            }
        }
        return false
    }
}

// MARK: - 决定placeholderView是否显示
extension YSOriginalProtocol where OriginalType: UITableView{
    
    /// 如果无数据显示某种类型的placeholderView，有数据隐藏所有的placeholderView
    public func placeholder_show_ifHasNoData(type: YSPlaceholderEnum){
        DispatchQueue.main.async { [weak originalObj] in
            guard let originalView = originalObj else{ return }
            if originalView.hasRows(){
                placeholder_hide()
            } else{
                placeholder_show(type: type)
            }
        }
    }
}
