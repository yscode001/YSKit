//
//  UIScrollView+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit

// MARK: - 设置属性
public extension YSOriginalObjectProtocol where OriginalObjectType: UIScrollView{
    
    func set_paging_bounces(_ isPagingEnabled: Bool, _ bounces: Bool) -> OriginalObjectType{
        originalObject.isPagingEnabled = isPagingEnabled
        originalObject.bounces = bounces
        return originalObject
    }
    
    func setIndicator(_ horizontal: Bool, _ vertical: Bool) -> OriginalObjectType{
        originalObject.showsHorizontalScrollIndicator = horizontal
        originalObject.showsVerticalScrollIndicator = vertical
        return originalObject
    }
}

// MARK: - 偏移
public extension YSOriginalObjectProtocol where OriginalObjectType: UIScrollView{
    
    /// 最大偏移量x轴
    var maxOffsetX: Int{
        return Int(originalObject.contentSize.width - originalObject.frame.width)
    }
    
    /// 最大偏移量y轴
    var maxOffsetY: Int{
        return Int(originalObject.contentSize.height - originalObject.frame.height)
    }
    
    /// 是否滑动到了最底部
    var isScrolledBottom: Bool{
        if Int(originalObject.contentSize.height) <= Int(originalObject.frame.height){
            return true
        }
        // 考虑到弹性特性，所以这里用>=
        return Int(originalObject.contentOffset.y) >= Int(originalObject.contentSize.height - originalObject.frame.height)
    }
    
    /// 是否滑动到了最右边
    var isScrolledRight: Bool{
        if Int(originalObject.contentSize.width) <= Int(originalObject.frame.width){
            return true
        }
        // 考虑到弹性特性，所以这里用>=
        return Int(originalObject.contentOffset.x) >= Int(originalObject.contentSize.width - originalObject.frame.width)
    }
}

// MARK: - 快照
public extension YSOriginalObjectProtocol where OriginalObjectType: UIScrollView{
    
    /// 快照
    func snapshot(complete: @escaping((UIImage?) -> ())){
        if originalObject.bounds.size.width <= 0 || originalObject.bounds.size.height <= 0{
            complete(nil)
            return
        }
        let contentW = originalObject.contentSize.width > 0 ? originalObject.contentSize.width : originalObject.bounds.width
        let contentH = originalObject.contentSize.height > 0 ? originalObject.contentSize.height : originalObject.bounds.height
        
        let savedContentOffSet = originalObject.contentOffset
        let savedFrame = originalObject.frame
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: contentW, height: contentH), false, 0)
        
        originalObject.contentOffset = .zero
        originalObject.frame = CGRect(x: 0, y: 0, width: contentW, height: contentH)
        
        originalObject.drawHierarchy(in: originalObject.frame, afterScreenUpdates: true)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        originalObject.contentOffset = savedContentOffSet
        originalObject.frame = savedFrame
        
        UIGraphicsEndImageContext()
        complete(img)
    }
}

// MARK: - 下面几个页码索引适用情况：整页左右滑动，并且每一页的宽度和SV的宽度相同
public extension YSOriginalObjectProtocol where OriginalObjectType: UIScrollView{
    
    /// 总页数
    var totalPageCount:Int{
        get{
            if originalObject.contentSize.width <= 0 || originalObject.frame.width <= 0{
                return 0
            }
            return Int(originalObject.contentSize.width / originalObject.frame.width)
        }
    }
    
    /// 总页码索引
    var totalPageIndex:Int{
        get{
            if originalObject.contentSize.width <= 0 || originalObject.frame.width <= 0{
                return 0
            }
            return Int(originalObject.contentSize.width / originalObject.frame.width) - 1
        }
    }
    
    /// 滚动至某一页
    ///
    /// - Parameters:
    ///   - languageLTR: 国际化语言方向
    ///   - pageIndex: 页码
    ///   - animate: 是否需要动画
    func scrollToPageIndex(languageLTR: Bool, pageIndex: Int, animated: Bool){
        if originalObject.contentSize.width <= 0 || originalObject.frame.width <= 0{
            return
        }
        if pageIndex < 0 || pageIndex > totalPageIndex{
            return
        }
        if languageLTR{
            let offsetX = originalObject.frame.width * CGFloat(pageIndex)
            originalObject.setContentOffset(CGPoint(x: offsetX, y: 0), animated: animated)
        } else{
            let offsetX = originalObject.frame.width * CGFloat(totalPageIndex - pageIndex)
            originalObject.setContentOffset(CGPoint(x: offsetX, y: 0), animated: animated)
        }
    }
    
    /// 滑动结束时显示的页码索引
    ///
    /// - Parameter languageLTR: 国际化方向
    /// - Returns: 页码索引
    func currentPageIndex_scrollEnd(languageLTR: Bool) -> Int{
        if originalObject.contentSize.width <= 0 || originalObject.frame.width <= 0{
            return 0
        }
        let offsetX = originalObject.contentOffset.x
        let index = Int(offsetX / originalObject.frame.width)
        if languageLTR{
            return index
        }
        return (totalPageCount - 1) - index
    }
    
    /// 滑动期间显示的两个页面的一些属性
    ///
    /// - Parameter languageLTR: 国际化语言方向
    /// - Returns: 两个页面的一些属性
    func twoPageProperty_scrolling(languageLTR: Bool) -> (frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale: CGFloat){
        if originalObject.contentSize.width <= 0 || originalObject.frame.width <= 0{
            return (0, 0, 0, 0)
        }
        if !originalObject.isDragging && !originalObject.isDecelerating && !originalObject.isTracking{
            return (0, 0, 0, 0)
        }
        
        let offsetX = originalObject.contentOffset.x
        let svWidth = originalObject.frame.width
        
        let leftIndex = Int(offsetX / svWidth) // 左边选项的整形索引
        let leftIndex_float = offsetX / svWidth // 左边选项的浮点索引
        let percent = leftIndex_float - CGFloat(leftIndex) // 百分比
        
        let rightScale = percent // 右边选项缩放比
        let leftScale = 1 - percent // 左前选项缩放比
        if languageLTR{
            let frontIndex = leftIndex
            let frontScale = leftScale
            let behindIndex = frontIndex + 1
            let behindScale = rightScale
            
            if frontIndex < 0 || frontIndex > totalPageIndex{
                return (0, 0, 0, 0)
            }
            if behindIndex < 0 || behindIndex > totalPageIndex{
                return (0, 0, 0, 0)
            }
            if frontScale < 0 || frontScale > 1{
                return (0, 0, 0, 0)
            }
            if behindScale < 0 || behindScale > 1{
                return (0, 0, 0, 0)
            }
            return (frontIndex, behindIndex, frontScale, behindScale)
        } else{
            // 因为leftIndex总是取的小的，所以这里要加1
            let frontIndex = totalPageIndex - (leftIndex + 1)
            let frontScale = rightScale
            let behindIndex = frontIndex + 1
            let behindScale = leftScale
            
            if frontIndex < 0 || frontIndex > totalPageIndex{
                return (0, 0, 0, 0)
            }
            if behindIndex < 0 || behindIndex > totalPageIndex{
                return (0, 0, 0, 0)
            }
            if frontScale < 0 || frontScale > 1{
                return (0, 0, 0, 0)
            }
            if behindScale < 0 || behindScale > 1{
                return (0, 0, 0, 0)
            }
            return (frontIndex, behindIndex, frontScale, behindScale)
        }
    }
    
    /// 滑动期间显示的两个页面的一些属性
    ///
    /// - Parameter languageLTR: 国际化语言方向
    /// - Returns: 两个页面的一些属性
    func twoPageProperty_scrolling(languageLTR: Bool, currentPageIndex: Int) -> (scrollToFront: Bool, frontIndex: Int, behindIndex: Int, frontScale: CGFloat, behindScale: CGFloat){
        if originalObject.contentSize.width <= 0 || originalObject.frame.width <= 0{
            return (true, 0, 0, 0, 0)
        }
        if !originalObject.isDragging && !originalObject.isDecelerating && !originalObject.isTracking{
            return (true, 0, 0, 0, 0)
        }
        
        let offsetX = originalObject.contentOffset.x
        let svWidth = originalObject.frame.width
        
        let leftIndex = Int(offsetX / svWidth) // 左边选项的整形索引
        let leftIndex_float = offsetX / svWidth // 左边选项的浮点索引
        let percent = leftIndex_float - CGFloat(leftIndex) // 百分比
        
        let rightScale = percent // 右边选项缩放比
        let leftScale = 1 - percent // 左前选项缩放比
        if languageLTR{
            let frontIndex = leftIndex
            let frontScale = leftScale
            let behindIndex = frontIndex + 1
            let behindScale = rightScale
            
            if frontIndex < 0 || frontIndex > totalPageIndex{
                return (true, 0, 0, 0, 0)
            }
            if behindIndex < 0 || behindIndex > totalPageIndex{
                return (true, 0, 0, 0, 0)
            }
            if frontScale < 0 || frontScale > 1{
                return (true, 0, 0, 0, 0)
            }
            if behindScale < 0 || behindScale > 1{
                return (true, 0, 0, 0, 0)
            }
            let scrollToFront = frontIndex < currentPageIndex
            return (scrollToFront, frontIndex, behindIndex, frontScale, behindScale)
        } else{
            // 因为leftIndex总是取的小的，所以这里要加1
            let frontIndex = totalPageIndex - (leftIndex + 1)
            let frontScale = rightScale
            let behindIndex = frontIndex + 1
            let behindScale = leftScale
            
            if frontIndex < 0 || frontIndex > totalPageIndex{
                return (true, 0, 0, 0, 0)
            }
            if behindIndex < 0 || behindIndex > totalPageIndex{
                return (true, 0, 0, 0, 0)
            }
            if frontScale < 0 || frontScale > 1{
                return (true, 0, 0, 0, 0)
            }
            if behindScale < 0 || behindScale > 1{
                return (true, 0, 0, 0, 0)
            }
            let scrollToFront = frontIndex < currentPageIndex
            return (scrollToFront, frontIndex, behindIndex, frontScale, behindScale)
        }
    }
}
