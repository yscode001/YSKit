//
//  YSBaseCell_tbv_value2.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import UIKit

open class YSBaseCell_tbv_value2: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
        setupProperty()
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProperty()
        setupUI()
    }
    
    /// 设置属性
    open func setupProperty(){
        selectionStyle = .none
    }
    
    /// 设置UI
    open func setupUI(){
        
    }
}
