//
//  YSCategoryView.swift
//  YSCategoryView
//
//  Created by yaoshuai on 2018/6/21.
//  Copyright © 2018年 YS. All rights reserved.
//

import UIKit

public class YSCategoryView: UIControl {
    
    internal var titleList = [String]() // 标题数组
    internal var style = YSCategoryViewStyle.ys.create() // 样式
    internal var labelList = [YSCategoryViewLabel]() // 按钮数组
    internal var label_selected:YSCategoryViewLabel? // 当前选中的按钮，默认第1个
    
    // 监听内容SV的滚动，不传没有缩放效果
    internal weak var contentSV:UIScrollView?
    
    internal lazy var scrollV:UIScrollView = {
        let v = UIScrollView()
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    internal lazy var containerV:UIView = UIView()
    
    private lazy var identifierLine:UIView = UIView()
    
    private lazy var bottomLine:UIView = UIView()
    
    // 添加自己的kvo
    internal var ys_categoryview_context = 0
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal convenience init(titleList: [String], style: YSCategoryViewStyle, contentSV: UIScrollView?) {
        // 这里先给个默认值，否则会报约束冲突，外界可随意布局，反正都是自动布局
        let rect = CGRect(x: 0, y: 0, width: UIScreen.ys.mainWidth, height: 50)
        self.init(frame: rect)
        self.style = style
        
        self.contentSV = contentSV
        contentSV?.bounces = false
        contentSV?.addObserver(self, forKeyPath: "contentOffset", options: .new, context: &ys_categoryview_context)
        
        for title in titleList{
            // 做下排重处理
            if !self.titleList.contains(title){
                self.titleList.append(title)
            }
        }
        
        checkupStyle()
        setupStyle()
        setupUI()
        layoutLabels()
    }
    
    deinit {
        contentSV?.removeObserver(self, forKeyPath: "contentOffset", context: &ys_categoryview_context)
    }
    
    private func checkupStyle(){
        if style.identifyerLineSize.width < 0{
            style.identifyerLineSize.width = 0
        }
        if style.identifyerLineSize.height < 0{
            style.identifyerLineSize.height = 0
        }
        if style.identifyerLineBottomDistance < 0{
            style.identifyerLineBottomDistance = 0
        }
        if style.bottomLineHeight < 0{
            style.bottomLineHeight = 0
        }
        if style.maxScale < 1.0{
            style.maxScale = 1.0
        }
        if style.itemMargin < 0{
            style.itemWidth = 0
        }
        if style.itemWidth < 0{
            style.itemWidth = 0
        }
    }
    
    private func setupStyle(){
        backgroundColor = style.bgColor
        scrollV.backgroundColor = style.bgColor
        containerV.backgroundColor = style.bgColor
        
        identifierLine.backgroundColor = style.identifierLineColor
        identifierLine.layer.cornerRadius = style.identifyerLineSize.height * 0.5
        identifierLine.layer.masksToBounds = true
        
        bottomLine.backgroundColor = style.bottomLineColor
    }
    private func setupUI(){
        addSubview(scrollV)
        addSubview(bottomLine)
        
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: scrollV, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: scrollV, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: scrollV, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: scrollV, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -style.bottomLineHeight))
        
        addConstraint(NSLayoutConstraint(item: bottomLine, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: bottomLine, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: bottomLine, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: bottomLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 0, constant: style.bottomLineHeight))
        
        scrollV.addSubview(containerV)
        containerV.addSubview(identifierLine)
        
        containerV.translatesAutoresizingMaskIntoConstraints = false
        
        scrollV.addConstraint(NSLayoutConstraint(item: containerV, attribute: .leading, relatedBy: .equal, toItem: scrollV, attribute: .leading, multiplier: 1, constant: 0))
        scrollV.addConstraint(NSLayoutConstraint(item: containerV, attribute: .trailing, relatedBy: .equal, toItem: scrollV, attribute: .trailing, multiplier: 1, constant: 0))
        scrollV.addConstraint(NSLayoutConstraint(item: containerV, attribute: .top, relatedBy: .equal, toItem: scrollV, attribute: .top, multiplier: 1, constant: 0))
        scrollV.addConstraint(NSLayoutConstraint(item: containerV, attribute: .bottom, relatedBy: .equal, toItem: scrollV, attribute: .bottom, multiplier: 1, constant: 0))
        scrollV.addConstraint(NSLayoutConstraint(item: containerV, attribute: .height, relatedBy: .equal, toItem: scrollV, attribute: .height, multiplier: 1, constant: 0))
    }
    
    private func createLabel(title: String, tag: Int) -> YSCategoryViewLabel{
        let v = YSCategoryViewLabel(maxScale: style.maxScale, font: style.font, font_selected: style.font_selected, color: style.textColor, color_selected: style.textColor_selected)
        v.text = title
        v.addTarget(target: self, action: #selector(labelClick(tap:)))
        v.backgroundColor = style.bgColor
        v.tag = tag
        return v
    }
    internal func layoutLabels(){
        label_selected = nil
        for lbl in labelList{
            lbl.removeFromSuperview()
        }
        labelList.removeAll()
        var layoutLabel:YSCategoryViewLabel?
        for (idx, title) in titleList.enumerated(){
            let lbl = createLabel(title: title, tag: idx)
            containerV.addSubview(lbl)
            labelList.append(lbl)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            containerV.addConstraint(NSLayoutConstraint(item: lbl, attribute: .top, relatedBy: .equal, toItem: containerV, attribute: .top, multiplier: 1, constant: 0))
            containerV.addConstraint(NSLayoutConstraint(item: lbl, attribute: .bottom, relatedBy: .equal, toItem: containerV, attribute: .bottom, multiplier: 1, constant: 0))
            if idx == 0{ // 第一个button
                containerV.addConstraint(NSLayoutConstraint(item: lbl, attribute: .leading, relatedBy: .equal, toItem: containerV, attribute: .leading, multiplier: 1, constant: style.itemMargin))
            } else{ // 非第一个button
                containerV.addConstraint(NSLayoutConstraint(item: lbl, attribute: .leading, relatedBy: .equal, toItem: layoutLabel!, attribute: .trailing, multiplier: 1, constant: style.itemMargin))
            }
            if idx == titleList.count - 1{ // 最后一个button
                containerV.addConstraint(NSLayoutConstraint(item: lbl, attribute: .trailing, relatedBy: .equal, toItem: containerV, attribute: .trailing, multiplier: 1, constant: -style.itemMargin))
            }
            if style.itemWidth > 0{
                containerV.addConstraint(NSLayoutConstraint(item: lbl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 0, constant: style.itemWidth))
            }
            layoutLabel = lbl
        }
        containerV.bringSubviewToFront(identifierLine)
    }
    
    internal func selectLabel(label: YSCategoryViewLabel, animate: Bool){
        label_selected?.isSelected = false
        label.isSelected = true
        
        label_selected = label
        
        scrollToCenter(label: label, animate: animate)
    }
    
    private func scrollToCenter(label: YSCategoryViewLabel, animate: Bool){
        func layoutIdentifierLine_endScroll(animate: Bool){
            if style.identifyerLineSize.height <= 0{
                return
            }
            if label.frame == CGRect.zero || containerV.frame == CGRect.zero{
                return
            }
            var x = label.frame.origin.x
            let y = containerV.frame.height - style.identifyerLineSize.height - style.identifyerLineBottomDistance
            var width = style.identifyerLineSize.width
            if style.identifyerLineSize.width > 0{ // 固定尺寸，居中显示
                x = label.center.x - style.identifyerLineSize.width * 0.5
            } else{ // 宽度随条目走
                width = label.frame.width
            }
            if animate{
                UIView.animate(withDuration: 0.25) {
                    self.identifierLine.frame = CGRect(x: x, y: y, width: width, height: self.style.identifyerLineSize.height)
                    // self.layoutIfNeeded()
                }
            } else{
                identifierLine.frame = CGRect(x: x, y: y, width: width, height: style.identifyerLineSize.height)
                // layoutSubviews()
            }
        }
        
        if scrollV.contentSize.width <= scrollV.frame.width{
            layoutIdentifierLine_endScroll(animate: animate)
            return
        }
        
        let minimumOffsetX:CGFloat = 0
        let maximunOffsetX = scrollV.contentSize.width - scrollV.frame.width
        var offsetX = label.center.x - scrollV.frame.width * 0.5
        if offsetX < minimumOffsetX{
            offsetX = minimumOffsetX
        } else if offsetX > maximunOffsetX{
            offsetX = maximunOffsetX
        }
        scrollV.setContentOffset(CGPoint(x: offsetX, y: 0), animated: animate)
        
        layoutIdentifierLine_endScroll(animate: animate)
    }
    
    @objc private func labelClick(tap: UITapGestureRecognizer){
        guard let label = tap.view as? YSCategoryViewLabel else {
            return
        }
        if let lblS = label_selected,lblS == label{
            return
        }
        selectLabel(label: label, animate: true)
        sendActions(for: .valueChanged)
    }
}

// MARK: - 监听内容SV的滚动,设置缩放比及标识线位置
extension YSCategoryView{
    
    /// 设置缩放比,LTR(前为左),RTL(前为右)
    ///
    /// - Parameters:
    ///   - frontIndex: 前边选项索引
    ///   - behindIndex: 后边选项索引
    ///   - frontScale: 前边选项缩放比[0,1]
    ///   - behindScale: 后边选项缩放比[0,1]
    private func ys_setLabelScale(frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale: CGFloat){
        labelList[frontIndex].setupScale(scale: frontScale)
        labelList[behindIndex].setupScale(scale: behindScale)
    }
    
    // 标识线拉伸动画,注意：因为有缩放，所以x和width一直在变
    private func ys_identifierLine_stretch_LTR(scrollToFront: Bool, frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale: CGFloat){
        let frontFrame = labelList[frontIndex].frame
        let behindFrame = labelList[behindIndex].frame
        if style.identifyerLineSize.width > 0{ // 固定尺寸拉伸
            let itemWidth = style.identifyerLineSize.width
            if scrollToFront{ // 向前滑，说明标识线现在在behindIndex的位置，frontScale:0->1，behindScale:1->0
                // frontScale(0-0.5),leading往前走;frontScale(0.5-1.0),trailing往前走
                if frontScale >= 0 && frontScale <= 0.5{
                    let twoMinXDistance = (frontFrame.midX - itemWidth * 0.5) - (behindFrame.midX - itemWidth * 0.5)
                    identifierLine.frame.origin.x = (behindFrame.midX - itemWidth * 0.5) + twoMinXDistance * frontScale * 2
                    identifierLine.frame.size.width = (behindFrame.midX + itemWidth * 0.5) - identifierLine.frame.origin.x
                } else{
                    identifierLine.frame.origin.x = frontFrame.midX - itemWidth * 0.5
                    let totalWidth = (behindFrame.midX + itemWidth * 0.5) - (frontFrame.midX - itemWidth * 0.5)
                    identifierLine.frame.size.width = totalWidth - (totalWidth - itemWidth) * (frontScale - 0.5) * 2
                }
            } else{ // 向后滑，说明标识线现在在frontIndex的位置，frontScale:1->0，behindScale:0->1
                // behindScale(0-0.5),trailing往后走;behindScale(0.5-1.0),leading往后走
                if behindScale >= 0 && behindScale <= 0.5{
                    identifierLine.frame.origin.x = frontFrame.midX - itemWidth * 0.5
                    let twoMaxXDistance = (behindFrame.midX + itemWidth * 0.5) - (frontFrame.midX + itemWidth * 0.5)
                    identifierLine.frame.size.width = itemWidth + twoMaxXDistance * behindScale * 2
                } else{
                    let twoMinXDistance = (behindFrame.midX - itemWidth * 0.5) - (frontFrame.midX - itemWidth * 0.5)
                    let totalWidth = (behindFrame.midX + itemWidth * 0.5) - (frontFrame.midX - itemWidth * 0.5)
                    identifierLine.frame.origin.x = (frontFrame.midX - itemWidth * 0.5) + twoMinXDistance * (behindScale - 0.5) * 2
                    identifierLine.frame.size.width = totalWidth - (totalWidth - itemWidth) * (behindScale - 0.5) * 2
                }
            }
        } else{ // leading、trailing随条目拉伸
            if scrollToFront{ // 向前滑，说明标识线现在在behindIndex的位置，frontScale:0->1，behindScale:1->0
                // frontScale(0-0.5),leading往前走;frontScale(0.5-1.0),trailing往前走
                if frontScale >= 0 && frontScale <= 0.5{
                    let twoMinXDistance = frontFrame.minX - behindFrame.minX
                    identifierLine.frame.origin.x = behindFrame.minX + twoMinXDistance * frontScale * 2
                    identifierLine.frame.size.width = behindFrame.maxX - identifierLine.frame.origin.x
                } else{
                    identifierLine.frame.origin.x = frontFrame.minX
                    identifierLine.frame.size.width = frontFrame.width + (behindFrame.maxX - frontFrame.maxX) * (1 - frontScale) * 2
                }
            } else{ // 向后滑，说明标识线现在在frontIndex的位置，frontScale:1->0，behindScale:0->1
                // behindScale(0-0.5),trailing往后走;behindScale(0.5-1.0),leading往后走
                if behindScale >= 0 && behindScale <= 0.5{
                    identifierLine.frame.origin.x = frontFrame.minX
                    let twoMaxXDistance = behindFrame.maxX - frontFrame.maxX
                    identifierLine.frame.size.width = frontFrame.maxX + twoMaxXDistance * behindScale * 2 - frontFrame.minX
                } else{
                    let twoMinXDistance = behindFrame.minX - frontFrame.minX
                    identifierLine.frame.origin.x = frontFrame.minX + twoMinXDistance * (behindScale - 0.5) * 2
                    identifierLine.frame.size.width = behindFrame.maxX - identifierLine.frame.minX
                }
            }
        }
    }
    
    // 标识线拉伸动画,注意：因为有缩放，所以x和width一直在变
    private func ys_identifierLine_stretch_RTL(scrollToFront: Bool, frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale:CGFloat){
        let frontFrame = labelList[frontIndex].frame
        let behindFrame = labelList[behindIndex].frame
        if style.identifyerLineSize.width > 0{ // 固定尺寸拉伸
            let itemWidth = style.identifyerLineSize.width
            if scrollToFront{ // 向前滑，说明标识线现在在behindIndex的位置，frontScale:0->1，behindScale:1->0
                // frontScale(0-0.5),leading往前走;frontScale(0.5-1.0),trailing往前走
                if frontScale >= 0 && frontScale <= 0.5{
                    let twoMaxXDistance = (frontFrame.midX + itemWidth * 0.5) - (behindFrame.midX + itemWidth * 0.5)
                    identifierLine.frame.origin.x = behindFrame.midX - itemWidth * 0.5
                    identifierLine.frame.size.width = itemWidth + twoMaxXDistance * frontScale * 2
                } else{
                    let twoMinXDistance = (frontFrame.midX - itemWidth * 0.5) - (behindFrame.midX - itemWidth * 0.5)
                    identifierLine.frame.origin.x = (behindFrame.midX - itemWidth * 0.5) + twoMinXDistance * (frontScale - 0.5) * 2
                    identifierLine.frame.size.width = frontFrame.midX + itemWidth * 0.5 - identifierLine.frame.origin.x
                }
            } else{ // 向后滑，说明标识线现在在frontIndex的位置，frontScale:1->0，behindScale:0->1
                // behindScale(0-0.5),trailing往后走;behindScale(0.5-1.0),leading往后走
                if behindScale >= 0 && behindScale <= 0.5{
                    let twoMinXDistance = (frontFrame.midX - itemWidth * 0.5) - (behindFrame.midX - itemWidth * 0.5)
                    identifierLine.frame.origin.x = (frontFrame.midX - itemWidth * 0.5) - twoMinXDistance * behindScale * 2
                    identifierLine.frame.size.width = frontFrame.midX + itemWidth * 0.5 - identifierLine.frame.origin.x
                } else{
                    identifierLine.frame.origin.x = behindFrame.midX - itemWidth * 0.5
                    let twoMaxXDistance = (frontFrame.midX + itemWidth * 0.5) - (behindFrame.midX + itemWidth * 0.5)
                    identifierLine.frame.size.width = itemWidth + twoMaxXDistance * (1 - behindScale) * 2
                }
            }
        } else{ // leading、trailing随条目拉伸
            if scrollToFront{ // 向前滑，说明标识线现在在behindIndex的位置，frontScale:0->1，behindScale:1->0
                // frontScale(0-0.5),leading往前走;frontScale(0.5-1.0),trailing往前走
                if frontScale >= 0 && frontScale <= 0.5{
                    identifierLine.frame.origin.x = behindFrame.minX
                    identifierLine.frame.size.width = behindFrame.width + (frontFrame.maxX - behindFrame.maxX) * frontScale * 2
                } else{
                    identifierLine.frame.origin.x = behindFrame.minX + (frontFrame.minX - behindFrame.minX) * (frontScale - 0.5) * 2
                    identifierLine.frame.size.width = frontFrame.maxX - identifierLine.frame.origin.x
                }
            } else{ // 向后滑，说明标识线现在在frontIndex的位置，frontScale:1->0，behindScale:0->1
                // behindScale(0-0.5),trailing往后走;behindScale(0.5-1.0),leading往后走
                if behindScale >= 0 && behindScale <= 0.5{
                    identifierLine.frame.origin.x = frontFrame.minX - (frontFrame.minX - behindFrame.minX) * behindScale * 2
                    identifierLine.frame.size.width = frontFrame.maxX - identifierLine.frame.origin.x
                } else{
                    identifierLine.frame.origin.x = behindFrame.minX
                    identifierLine.frame.size.width = behindFrame.width + (frontFrame.maxX - behindFrame.maxX) * (1 - behindScale) * 2
                }
            }
        }
    }
    
    // 标识线平移动画
    private func ys_identifierLine_translation(scrollToFront: Bool, frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale: CGFloat){
        if style.identifyerLineSize.width > 0{ // 固定尺寸平移
            let towCenterXDistance = labelList[frontIndex].center.x - labelList[behindIndex].center.x
            var centerX:CGFloat = 0
            if scrollToFront{ // 向前滑，说明标识线现在在behindIndex的位置，frontScale:0->1，behindScale:1->0
                centerX = labelList[behindIndex].center.x + towCenterXDistance * frontScale
            } else{ // 向后滑，说明标识线现在在frontIndex的位置，frontScale:1->0，behindScale:0->1
                centerX = labelList[frontIndex].center.x - towCenterXDistance * behindScale
            }
            identifierLine.frame.origin.x = centerX - style.identifyerLineSize.width * 0.5
        } else{ // leading、trailing随条目平移
            let twoMinXDistance = labelList[frontIndex].frame.minX - labelList[behindIndex].frame.minX
            let twoMaxXDistance = labelList[frontIndex].frame.maxX - labelList[behindIndex].frame.maxX
            var minX:CGFloat = 0
            var maxX:CGFloat = 0
            if scrollToFront{ // 向前滑，说明标识线现在在behindIndex的位置，frontScale:0->1，behindScale:1->0
                minX = labelList[behindIndex].frame.minX + twoMinXDistance * frontScale
                maxX = labelList[behindIndex].frame.maxX + twoMaxXDistance * frontScale
            } else{ // 向后滑，说明标识线现在在frontIndex的位置，frontScale:1->0，behindScale:0->1
                minX = labelList[frontIndex].frame.minX - twoMinXDistance * behindScale
                maxX = labelList[frontIndex].frame.maxX - twoMaxXDistance * behindScale
            }
            identifierLine.frame.origin.x = minX
            identifierLine.frame.size.width = maxX - minX
        }
    }
    
    /// 设置标识线位置
    ///
    /// - Parameters:
    ///   - scrollToFront: 是否是向前滑(LTR:向右滑为true，RTL:向左滑为true)
    ///   - frontIndex: 前面索引
    ///   - behindIndex: 后面索引
    ///   - frontScale: 前面缩放比[0,1]
    ///   - behindScale: 后面缩放比[0,1]
    private func ys_setIdentifierLineFrame_scrolling(scrollToFront: Bool, frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale: CGFloat){
        if style.identifierLineAnimationType == .stretch{ // 拉伸动画
            if style.languageLTR{
                ys_identifierLine_stretch_LTR(scrollToFront: scrollToFront, frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
            } else{
                ys_identifierLine_stretch_RTL(scrollToFront: scrollToFront, frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
            }
        } else{ // 平移动画
            ys_identifierLine_translation(scrollToFront: scrollToFront, frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
        }
        layoutIfNeeded()
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context != &ys_categoryview_context{
            return
        }
        guard let contentScrollV = contentSV else{
            return
        }
        if !contentScrollV.isDragging && !contentScrollV.isDecelerating && !contentScrollV.isTracking{
            return
        }
        
        var scrollToFront = true // 滑动方向
        
        let offsetX = contentScrollV.contentOffset.x
        let svWidth = contentScrollV.frame.width
        
        let leftIndex = Int(offsetX / svWidth) // 左边选项的整形索引
        let leftIndex_float = offsetX / svWidth // 左边选项的浮点索引
        let percent = leftIndex_float - CGFloat(leftIndex) // 百分比
        
        let rightScale = percent // 右边选项缩放比
        let leftScale = 1 - percent // 左前选项缩放比
        
        if style.languageLTR{ // from left to right
            let frontIndex = leftIndex
            let frontScale = leftScale
            let behindIndex = frontIndex + 1
            let behindScale = rightScale
            
            if frontIndex < 0 || frontIndex >= labelList.count{
                return
            }
            if behindIndex < 0 || behindIndex >= labelList.count{
                return
            }
            if frontScale < 0 || frontScale > 1{
                return
            }
            if behindScale < 0 || behindScale > 1{
                return
            }
            
            if style.allowGradual{
                ys_setLabelScale(frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
            }
            
            // 上面是文字的缩放比，下面修改标识线的位置
            if style.identifyerLineSize.height <= 0{
                return
            }
            scrollToFront = frontIndex < (label_selected?.tag ?? 0)
            ys_setIdentifierLineFrame_scrolling(scrollToFront: scrollToFront, frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
        } else{ // from right to left
            let totalPageIndex = Int(contentScrollV.contentSize.width / contentScrollV.frame.width) - 1
            let frontIndex = totalPageIndex - (leftIndex + 1) // 因为leftIndex总是取的小的，所以这里要加1
            let frontScale = rightScale
            let behindIndex = frontIndex + 1
            let behindScale = leftScale
            
            if frontIndex < 0 || frontIndex >= labelList.count{
                return
            }
            if behindIndex < 0 || behindIndex >= labelList.count{
                return
            }
            if frontScale < 0 || frontScale > 1{
                return
            }
            if behindScale < 0 || behindScale > 1{
                return
            }
            
            if style.allowGradual{
                ys_setLabelScale(frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
            }
            
            // 上面是文字的缩放比，下面修改标识线的位置
            if style.identifyerLineSize.height <= 0{
                return
            }
            scrollToFront = frontIndex < (label_selected?.tag ?? 0)
            ys_setIdentifierLineFrame_scrolling(scrollToFront: scrollToFront, frontIndex: frontIndex, behindIndex: behindIndex, frontScale: frontScale, behindScale: behindScale)
        }
    }
}
