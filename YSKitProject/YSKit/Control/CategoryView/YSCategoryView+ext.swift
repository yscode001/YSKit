//
//  YSCategoryView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/12.
//

import UIKit

// MARK: - 初始化
public extension YSOriginalObject where OriginalObjectType == YSCategoryView{
    
    /// 创建分类视图
    static func create(titleList: [String], style: YSCategoryViewStyle, contentSV: UIScrollView?) -> YSCategoryView{
        return YSCategoryView(titleList: titleList, style: style, contentSV: contentSV)
    }
}

// MARK: - 重置条目
public extension YSOriginalObject where OriginalObjectType == YSCategoryView{
    
    /// 重置条目，会发valueChanged事件，选中第一项
    func resetTitles(titleList: [String]){
        originalObject.titleList.removeAll()
        for title in titleList{ // 做下排重处理
            if !originalObject.titleList.contains(title){
                originalObject.titleList.append(title)
            }
        }
        
        originalObject.layoutLabels()
        
        // 重置之后，会发送一个事件
        originalObject.sendActions(for: .valueChanged)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak originalObject] in
            guard let _ = originalObject else{ return }
            adapterLanguage()
        }
    }
}

// MARK: - 适配国际化语言(LTR)
public extension YSOriginalObject where OriginalObjectType == YSCategoryView{
    
    /// 适配国际化语言，选中并显示第一项
    func adapterLanguage(){
        if originalObject.scrollV.contentSize == .zero || originalObject.scrollV.frame == .zero || originalObject.scrollV.bounds == .zero || originalObject.frame == .zero || originalObject.bounds == .zero{
            return
        }
        if originalObject.style.languageLTR{
            originalObject.scrollV.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        } else{
            let offsetX = originalObject.scrollV.contentSize.width - originalObject.scrollV.frame.width
            if offsetX > 0{
                // 滚动至最右边
                originalObject.scrollV.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
            } else if offsetX < 0{
                // 显示在最右边
                originalObject.containerV.frame.origin.x = -offsetX
                originalObject.layoutIfNeeded()
            }
        }
        guard let firstLabel = originalObject.labelList.first else{
            return
        }
        originalObject.selectLabel(label: firstLabel, animate: false)
    }
}

// MARK: - 当前选中项
public extension YSOriginalObject where OriginalObjectType == YSCategoryView{
    
    /// 当前选中选项的索引
    var currentIndex:Int{
        return originalObject.label_selected?.tag ?? 0
    }
    
    /// 当前选中选项的标题
    var currentTitle:String{
        if 0 <= currentIndex && currentIndex < originalObject.titleList.count{
            return originalObject.titleList[currentIndex]
        }
        return ""
    }
}

// MARK: - 重置索引
public extension YSOriginalObject where OriginalObjectType == YSCategoryView{
    
    /// 仅仅重置索引，不会对外回调选中项
    ///
    /// - Parameter index: 索引
    func setCurrentIndex(index: Int){
        if index == (originalObject.label_selected?.tag ?? 0){
            return
        }
        for lbl in originalObject.labelList{
            if index == lbl.tag{
                originalObject.selectLabel(label: lbl, animate: true)
                return
            }
        }
    }
    
    /// 仅仅重置索引，不会对外回调选中项
    ///
    /// - Parameter title: 匹配的字符串
    func setCurrentIndex(title: String){
        if !originalObject.titleList.contains(title){
            return
        }
        for (index, titleStr) in originalObject.titleList.enumerated(){
            if titleStr == title{
                setCurrentIndex(index: index)
                return
            }
        }
    }
}

// MARK: - 相关联的SV即将释放时，调用
public extension YSOriginalObject where OriginalObjectType == YSCategoryView{
    
    /// 相关联的SV即将释放时，调用
    func releaseContentSV(){
        originalObject.contentSV?.removeObserver(originalObject, forKeyPath: "contentOffset", context: &originalObject.ys_categoryview_context)
    }
}
