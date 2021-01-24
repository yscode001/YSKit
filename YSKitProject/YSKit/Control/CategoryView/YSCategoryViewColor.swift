//
//  YSCategoryViewColor.swift
//  YSCategoryView
//
//  Created by 姚帅 on 2018/6/27.
//  Copyright © 2018年 YS. All rights reserved.
//

import UIKit

/// 分类视图颜色
public struct YSCategoryViewColor: YSCoreProtocol{
    
    // MARK: - light模式下的颜色
    
    public var lightRed:CShort = 0
    
    public var lightGreen:CShort = 0
    
    public var lightBlue:CShort = 0
    
    // MARK: - dark模式下的颜色
    
    public var darkRed:CShort = 0
    
    public var darkGreen:CShort = 0
    
    public var darkBlue:CShort = 0
    
    // MARK: - 初始化
    
    fileprivate init(){}
    
    fileprivate init(lightRed: CShort, lightGreen: CShort, lightBlue: CShort, darkRed: CShort, darkGreen: CShort, darkBlue: CShort){
        self.lightRed = lightRed
        self.lightGreen = lightGreen
        self.lightBlue = lightBlue
        self.darkRed = darkRed
        self.darkGreen = darkGreen
        self.darkBlue = darkBlue
    }
}

public extension YSOriginalObject where OriginalObjectType == YSCategoryViewColor{
 
    /// 创建默认颜色
    static func create() -> YSCategoryViewColor{
        return YSCategoryViewColor()
    }
    
    /// 创建light和dark下的颜色
    static func create(lightRed: CShort, lightGreen: CShort, lightBlue: CShort, darkRed: CShort, darkGreen: CShort, darkBlue: CShort) -> YSCategoryViewColor{
        return YSCategoryViewColor(lightRed: lightRed, lightGreen: lightGreen, lightBlue: lightBlue, darkRed: darkRed, darkGreen: darkGreen, darkBlue: darkBlue)
    }
}
