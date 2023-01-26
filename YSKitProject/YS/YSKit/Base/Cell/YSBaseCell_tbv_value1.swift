//
//  YSBaseCell_tbv_value1.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import UIKit

open class YSBaseCell_tbv_value1: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setupProperty()
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProperty()
        setupUI()
    }
    
    /// 先执行setupProperty，后执行setupUI
    open func setupProperty(){
        selectionStyle = .default
    }
    
    /// 先执行setupProperty，后执行setupUI
    open func setupUI(){
        
    }
}
