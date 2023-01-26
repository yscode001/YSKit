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
    
    /// 先执行setupProperty，后执行setupUI
    open func setupProperty(){
        
    }
    
    /// 先执行setupProperty，后执行setupUI
    open func setupUI(){
        
    }
}
