//
//  UITableView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import UIKit

// MARK: - 设置header、footer的预估高度

// 如果不设置，iOS11reload的时候可能会上下跳动

public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    @discardableResult func set_cell_autoHeight(_ estimatedHeight: CGFloat) -> OriginalObjectType{
        originalObject.estimatedRowHeight = estimatedHeight
        originalObject.rowHeight = UITableView.automaticDimension
        return originalObject
    }
    
    @discardableResult func set_header_footer_estimatedHeight(header: CGFloat, footer: CGFloat) -> OriginalObjectType{
        originalObject.estimatedSectionHeaderHeight = header
        originalObject.estimatedSectionFooterHeight = footer
        return originalObject
    }
}

// MARK: - 设置系统分隔线样式
public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    @discardableResult func setSeparator(_ style: UITableViewCell.SeparatorStyle, color: UIColor?) -> OriginalObjectType{
        originalObject.separatorStyle = style
        originalObject.separatorColor = color
        return originalObject
    }
    
    @discardableResult func setSeparator(_ style: UITableViewCell.SeparatorStyle, inset: UIEdgeInsets, color: UIColor?) -> OriginalObjectType{
        originalObject.separatorStyle = style
        originalObject.separatorInset = inset
        originalObject.separatorColor = color
        return originalObject
    }
}

// MARK: - 设置代理、注册cell
public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    @discardableResult func dataSource_delegate(_ dataSource: UITableViewDataSource?, _ delegate: UITableViewDelegate?) -> OriginalObjectType{
        originalObject.dataSource = dataSource
        originalObject.delegate = delegate
        return originalObject
    }
    
    @discardableResult func register(_ cells: [String: AnyClass]) -> OriginalObjectType{
        for item in cells{
            originalObject.register(item.value, forCellReuseIdentifier: item.key)
        }
        return originalObject
    }
}

// MARK: - 头尾部视图
public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    @discardableResult func tableHeaderView(_ headerV: UIView) -> OriginalObjectType{
        if originalObject.tableHeaderView != headerV{
            originalObject.tableHeaderView = headerV
        }
        return originalObject
    }
    
    @discardableResult func tableFooterView(_ footerV: UIView) -> OriginalObjectType{
        if originalObject.tableFooterView != footerV{
            originalObject.tableFooterView = footerV
        }
        return originalObject
    }
    
    @discardableResult func tableHeaderView_clear() -> OriginalObjectType{
        if originalObject.tableHeaderView != nil{
            originalObject.tableHeaderView = nil
        }
        return originalObject
    }
    
    @discardableResult func tableFooterView_clear() -> OriginalObjectType{
        if originalObject.tableFooterView != nil{
            originalObject.tableFooterView = nil
        }
        return originalObject
    }
}

// MARK: - 滑动到顶部、底部
public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    /// 滑动到顶部
    func scrollToTop(at: UITableView.ScrollPosition, animated: Bool){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalObj = originalObject else{ return }
            if originalObj.numberOfSections <= 0{
                return
            }
            if originalObj.numberOfRows(inSection: 0) <= 0{
                return
            }
            originalObj.scrollToRow(at: IndexPath(row: 0, section: 0), at: at, animated: animated)
        }
    }
    
    /// 滑动过底部
    func scrollToBottom(at: UITableView.ScrollPosition, animated: Bool){
        DispatchQueue.main.async { [weak originalObject] in
            guard let originalObj = originalObject else{ return }
            if originalObj.numberOfSections <= 0{
                return
            }
            let maxSection = originalObj.numberOfSections - 1
            let maxRow = originalObj.numberOfRows(inSection: maxSection) - 1
            originalObj.scrollToRow(at: IndexPath(row: maxRow, section: maxSection), at: at, animated: animated)
        }
    }
}

// MARK: - 重加载和删除的加固处理
public extension YSOriginalObjectProtocol where OriginalObjectType: UITableView{
    
    /// 判断是多secion还是单section
    var isMultiSections:Bool{
        return originalObject.numberOfSections > 1
    }
    
    /// 删除，已加各种判断，外界直接使用
    func deleteRow(at: IndexPath, with: UITableView.RowAnimation){
        DispatchQueue.main.async { [weak originalObject] in
            guard let tbv = originalObject else{ return }
            if at.section < 0 || at.row < 0 || tbv.numberOfSections <= 0{
                return
            }
            let lastSection = tbv.numberOfSections - 1
            if lastSection < at.section{
                return
            }
            if tbv.numberOfRows(inSection: at.section) <= 0{
                return
            }
            let lastRow = tbv.numberOfRows(inSection: at.section) - 1
            if lastRow < at.row{
                return
            }
            guard let _ = tbv.indexPathsForVisibleRows?.firstIndex(of: at) else{
                return
            }
            tbv.deleteRows(at: [at], with: with)
        }
    }
    
    /// 删除，已加各种判断，外界直接使用
    func deleteRows(at: [IndexPath], with: UITableView.RowAnimation){
        for indexp in at{
            deleteRow(at: indexp, with: with)
        }
    }
    
    /// 重新加载，已加各种判断，外界直接使用
    func reloadRow(at: IndexPath, with: UITableView.RowAnimation){
        DispatchQueue.main.async { [weak originalObject] in
            guard let tbv = originalObject else{ return }
            if at.section < 0 || at.row < 0 || tbv.numberOfSections <= 0{
                return
            }
            let lastSection = tbv.numberOfSections - 1
            if lastSection < at.section{
                return
            }
            if tbv.numberOfRows(inSection: at.section) <= 0{
                return
            }
            let lastRow = tbv.numberOfRows(inSection: at.section) - 1
            if lastRow < at.row{
                return
            }
            guard let _ = tbv.indexPathsForVisibleRows?.firstIndex(of: at) else{
                return
            }
            tbv.reloadRows(at: [at], with: with)
        }
    }
    
    /// 重新加载，已加各种判断，外界直接使用
    func reloadRows(at: [IndexPath], with: UITableView.RowAnimation){
        for indexp in at{
            reloadRow(at: indexp, with: with)
        }
    }
}
