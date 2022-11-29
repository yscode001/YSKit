//
//  TableView.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func tbv(bgColor: UIColor, frame: CGRect, style: UITableView.Style) -> UITableView{
        return UITableView(frame: frame, style: style).ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            $0.register(EmptyTbvCell.self, forCellReuseIdentifier: EmptyCellID)
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
            $0.tableFooterView = UIView()
        }
    }
    
    static func tbv(bgColor: UIColor, frame: CGRect, style: UITableView.Style, cells: [String: AnyClass]) -> UITableView{
        return UITableView(frame: frame, style: style).ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            $0.register(EmptyTbvCell.self, forCellReuseIdentifier: EmptyCellID)
            for item in cells{
                $0.register(item.value, forCellReuseIdentifier: item.key)
            }
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
            $0.tableFooterView = UIView()
        }
    }
    
    static func tbv(bgColor: UIColor, frame: CGRect, style: UITableView.Style, cells: [String: AnyClass], dataSource: UITableViewDataSource, delegate: UITableViewDelegate) -> UITableView{
        return UITableView(frame: frame, style: style).ys.then{
            $0.backgroundColor = bgColor
            $0.keyboardDismissMode = .onDrag
            $0.register(EmptyTbvCell.self, forCellReuseIdentifier: EmptyCellID)
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
