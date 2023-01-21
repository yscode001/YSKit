//
//  TableViewCell.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func tbvCell(_ tbv: UITableView , _ indexPath: IndexPath, _ identifier: String) -> UITableViewCell{
        return tbv.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    /// 注意，一定要保证注册了identifier = "EmptyCellID"
    static func tbvCell_empty(_ tbv: UITableView, _ indexPath: IndexPath) -> UITableViewCell{
        return tbv.dequeueReusableCell(withIdentifier: EmptyCellID, for: indexPath)
    }
    
    /// 创建UITableViewHeaderFooterView
    static func tbvHeaderFooterView(_ tbv: UITableView, _ identifier: String) -> UITableViewHeaderFooterView? {
        return tbv.dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
}
