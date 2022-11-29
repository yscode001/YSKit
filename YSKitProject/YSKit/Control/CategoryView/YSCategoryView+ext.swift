//
//  YSCategoryView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/12.
//

import UIKit

// MARK: - 初始化
public extension YSOriginalObject where OriginalType == YSCategoryView{
    
    /// 创建分类视图
    static func create(titleList: [String], style: YSCategoryViewStyle, contentSV: UIScrollView?) -> YSCategoryView{
        return YSCategoryView(titleList: titleList, style: style, contentSV: contentSV)
    }
}

// MARK: - 重置条目
public extension YSOriginalObject where OriginalType == YSCategoryView{
    
    /// 重置条目，会发valueChanged事件，选中第一项
    func resetTitles(titleList: [String]){
        originalObj.titleList.removeAll()
        for title in titleList{ // 做下排重处理
            if !originalObj.titleList.contains(title){
                originalObj.titleList.append(title)
            }
        }
        
        originalObj.layoutLabels()
        
        // 重置之后，会发送一个事件
        originalObj.sendActions(for: .valueChanged)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak originalObj] in
            guard let _ = originalObj else{ return }
            adapterLanguage()
        }
    }
}

// MARK: - 适配国际化语言(LTR)
public extension YSOriginalObject where OriginalType == YSCategoryView{
    
    /// 适配国际化语言，选中并显示第一项
    func adapterLanguage(){
        if originalObj.scrollV.contentSize == .zero || originalObj.scrollV.frame == .zero || originalObj.scrollV.bounds == .zero || originalObj.frame == .zero || originalObj.bounds == .zero{
            return
        }
        if originalObj.style.languageLTR{
            originalObj.scrollV.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        } else{
            let offsetX = originalObj.scrollV.contentSize.width - originalObj.scrollV.frame.width
            if offsetX > 0{
                // 滚动至最右边
                originalObj.scrollV.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
            } else if offsetX < 0{
                // 显示在最右边
                originalObj.containerV.frame.origin.x = -offsetX
                originalObj.layoutIfNeeded()
            }
        }
        guard let firstLabel = originalObj.labelList.first else{
            return
        }
        originalObj.selectLabel(label: firstLabel, animate: false)
    }
}

// MARK: - 当前选中项
public extension YSOriginalObject where OriginalType == YSCategoryView{
    
    /// 当前选中选项的索引
    var currentIndex:Int{
        return originalObj.label_selected?.tag ?? 0
    }
    
    /// 当前选中选项的标题
    var currentTitle:String{
        if 0 <= currentIndex && currentIndex < originalObj.titleList.count{
            return originalObj.titleList[currentIndex]
        }
        return ""
    }
}

// MARK: - 重置索引
public extension YSOriginalObject where OriginalType == YSCategoryView{
    
    /// 仅仅重置索引，不会对外回调选中项
    ///
    /// - Parameter index: 索引
    func setCurrentIndex(index: Int){
        if index == (originalObj.label_selected?.tag ?? 0){
            return
        }
        for lbl in originalObj.labelList{
            if index == lbl.tag{
                originalObj.selectLabel(label: lbl, animate: true)
                return
            }
        }
    }
    
    /// 仅仅重置索引，不会对外回调选中项
    ///
    /// - Parameter title: 匹配的字符串
    func setCurrentIndex(title: String){
        if !originalObj.titleList.contains(title){
            return
        }
        for (index, titleStr) in originalObj.titleList.enumerated(){
            if titleStr == title{
                setCurrentIndex(index: index)
                return
            }
        }
    }
}

// MARK: - 相关联的SV即将释放时，调用
public extension YSOriginalObject where OriginalType == YSCategoryView{
    
    /// 相关联的SV即将释放时，调用
    func releaseContentSV(){
        originalObj.contentSV?.removeObserver(originalObj, forKeyPath: "contentOffset", context: &originalObj.ys_categoryview_context)
    }
}
