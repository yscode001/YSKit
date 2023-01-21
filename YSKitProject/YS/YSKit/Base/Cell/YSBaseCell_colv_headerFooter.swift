//
//  YSBaseCell_colv_headerFooter.swift
//  YSKit
//
//  Created by yaoshuai on 2020/12/20.
//

import UIKit

open class YSBaseCell_colv_headerFooter: UICollectionReusableView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
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
        
    }
    
    /// 设置UI
    open func setupUI(){
        
    }
}
