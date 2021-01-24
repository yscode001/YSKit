//
//  UITableView+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

// MARK: - 创建UITableView
public extension YSOriginalObjectProtocol where OriginalObjectType == UITableView{
    
    static func create(bgc: UIColor, frame: CGRect, style: UITableView.Style) -> OriginalObjectType{
        return UITableView(frame: frame, style: style).ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            $0.register(YSEmptyTbvCell.self, forCellReuseIdentifier: YSEmptyCellID)
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
            $0.tableFooterView = UIView()
        }
    }
    
    static func create(bgc: UIColor, frame: CGRect, style: UITableView.Style, cells: [String: AnyClass]) -> OriginalObjectType{
        return UITableView(frame: frame, style: style).ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            $0.register(YSEmptyTbvCell.self, forCellReuseIdentifier: YSEmptyCellID)
            for item in cells{
                $0.register(item.value, forCellReuseIdentifier: item.key)
            }
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
            $0.tableFooterView = UIView()
        }
    }
    
    static func create(bgc: UIColor, frame: CGRect, style: UITableView.Style, cells: [String: AnyClass], dataSource: UITableViewDataSource, delegate: UITableViewDelegate) -> OriginalObjectType{
        return UITableView(frame: frame, style: style).ys.then{
            $0.backgroundColor = bgc
            $0.keyboardDismissMode = .onDrag
            $0.register(YSEmptyTbvCell.self, forCellReuseIdentifier: YSEmptyCellID)
            for item in cells{
                $0.register(item.value, forCellReuseIdentifier: item.key)
            }
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
            $0.dataSource = dataSource
            $0.delegate = delegate
            $0.tableFooterView = UIView()
        }
    }
}

// MARK: - 创建UITableViewCell
public extension YSOriginalObjectProtocol where OriginalObjectType == UITableView{
    
    static func createCell(_ tableView: UITableView , _ indexPath: IndexPath, _ identifier: String) -> UITableViewCell{
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    /// 注意，一定要保证注册了identifier = "YSEmptyCellID"
    static func createCell_empty(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell{
        return tableView.dequeueReusableCell(withIdentifier: YSEmptyCellID, for: indexPath)
    }
    
    /// 创建UITableViewHeaderFooterView
    static func createHeaderFooterView(_ tableView: UITableView, _ identifier: String) -> UITableViewHeaderFooterView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier)
    }
}
