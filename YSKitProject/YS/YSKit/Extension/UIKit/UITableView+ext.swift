//
//  UITableView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/31.
//

import UIKit

// MARK: - 设置header、footer的预估高度

// 如果不设置，iOS11reload的时候可能会上下跳动

public extension YSOriginalProtocol where OriginalType: UITableView{
    
    @discardableResult func set_cell_autoHeight(_ estimatedHeight: CGFloat) -> OriginalType{
        originalObj.estimatedRowHeight = estimatedHeight
        originalObj.rowHeight = UITableView.automaticDimension
        return originalObj
    }
    
    @discardableResult func set_header_footer_estimatedHeight(header: CGFloat, footer: CGFloat) -> OriginalType{
        originalObj.estimatedSectionHeaderHeight = header
        originalObj.estimatedSectionFooterHeight = footer
        return originalObj
    }
}

// MARK: - 设置系统分隔线样式
public extension YSOriginalProtocol where OriginalType: UITableView{
    
    @discardableResult func setSeparator(_ style: UITableViewCell.SeparatorStyle, color: UIColor?) -> OriginalType{
        originalObj.separatorStyle = style
        originalObj.separatorColor = color
        return originalObj
    }
    
    @discardableResult func setSeparator(_ style: UITableViewCell.SeparatorStyle, inset: UIEdgeInsets, color: UIColor?) -> OriginalType{
        originalObj.separatorStyle = style
        originalObj.separatorInset = inset
        originalObj.separatorColor = color
        return originalObj
    }
}

// MARK: - 设置代理、注册cell
public extension YSOriginalProtocol where OriginalType: UITableView{
    
    @discardableResult func dataSource_delegate(_ dataSource: UITableViewDataSource?, _ delegate: UITableViewDelegate?) -> OriginalType{
        originalObj.dataSource = dataSource
        originalObj.delegate = delegate
        return originalObj
    }
    
    @discardableResult func register(_ cells: [String: AnyClass]) -> OriginalType{
        for item in cells{
            originalObj.register(item.value, forCellReuseIdentifier: item.key)
        }
        return originalObj
    }
}

// MARK: - 头尾部视图
public extension YSOriginalProtocol where OriginalType: UITableView{
    
    @discardableResult func tableHeaderView(_ headerV: UIView) -> OriginalType{
        if originalObj.tableHeaderView != headerV{
            originalObj.tableHeaderView = headerV
        }
        return originalObj
    }
    
    @discardableResult func tableFooterView(_ footerV: UIView) -> OriginalType{
        if originalObj.tableFooterView != footerV{
            originalObj.tableFooterView = footerV
        }
        return originalObj
    }
    
    @discardableResult func tableHeaderView_clear() -> OriginalType{
        if originalObj.tableHeaderView != nil{
            originalObj.tableHeaderView = nil
        }
        return originalObj
    }
    
    @discardableResult func tableFooterView_clear() -> OriginalType{
        if originalObj.tableFooterView != nil{
            originalObj.tableFooterView = nil
        }
        return originalObj
    }
}

// MARK: - 滑动到顶部、底部
public extension YSOriginalProtocol where OriginalType: UITableView{
    
    /// 滑动到顶部
    func scrollToTop(at: UITableView.ScrollPosition, animated: Bool){
        DispatchQueue.main.async { [weak originalObj] in
            guard let originalObj = originalObj else{ return }
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
        DispatchQueue.main.async { [weak originalObj] in
            guard let tbv = originalObj else{ return }
            if tbv.numberOfSections <= 0{
                return
            }
            let maxSection = tbv.numberOfSections - 1
            let maxRow = tbv.numberOfRows(inSection: maxSection) - 1
            tbv.scrollToRow(at: IndexPath(row: maxRow, section: maxSection), at: at, animated: animated)
        }
    }
}

// MARK: - 重加载和删除的加固处理
public extension YSOriginalProtocol where OriginalType: UITableView{
    
    /// 判断是多secion还是单section
    var isMultiSections:Bool{
        return originalObj.numberOfSections > 1
    }
    
    /// 删除，已加各种判断，外界直接使用
    func deleteRow(at: IndexPath, with: UITableView.RowAnimation){
        DispatchQueue.main.async { [weak originalObj] in
            guard let tbv = originalObj else{ return }
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
        DispatchQueue.main.async { [weak originalObj] in
            guard let tbv = originalObj else{ return }
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
    
    func reloadData(complete: @escaping() -> Void){
        UIView.animate(withDuration: 0, animations: {
            originalObj.reloadData()
        }, completion: { _ in
            complete()
        })
    }
}
