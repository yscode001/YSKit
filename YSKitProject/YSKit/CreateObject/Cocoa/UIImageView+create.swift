//
//  UIImageView+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

// MARK: - 根据image创建UIImageView
public extension YSOriginalObjectProtocol where OriginalObjectType == UIImageView{
    
    static func create(img: UIImage?) -> OriginalObjectType{
        return UIImageView(image: img)
    }
    
    static func create(img: UIImage?, userInteraction: Bool) -> OriginalObjectType{
        return UIImageView(image: img).ys.then{
            $0.isUserInteractionEnabled = userInteraction
        }
    }
    
    static func create(img: UIImage?, target: Any, action: Selector) -> OriginalObjectType{
        return UIImageView(image: img).ys.then{
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
}

// MARK: - 根据imageName创建UIImageView
public extension YSOriginalObjectProtocol where OriginalObjectType == UIImageView{
    
    static func create(imgName: String?) -> OriginalObjectType{
        let img = UIImage.ys.create(imgName)
        return UIImageView.ys.create(img: img)
    }
    
    static func create(imgName: String?, userInteraction: Bool) -> OriginalObjectType{
        let img = UIImage.ys.create(imgName)
        return UIImageView.ys.create(img: img, userInteraction: userInteraction)
    }
    
    static func create(imgName: String?, target: Any, action: Selector) -> OriginalObjectType{
        let img = UIImage.ys.create(imgName)
        return UIImageView.ys.create(img: img, target: target, action: action)
    }
}

// MARK: - 从bundle中加载image创建UIImageView
public extension YSOriginalObjectProtocol where OriginalObjectType == UIImageView{
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func create(fileName: String, bundle: Bundle? = Bundle.main) -> OriginalObjectType{
        let img = UIImage.ys.create(fileName: fileName, bundle: bundle)
        return UIImageView.ys.create(img: img)
    }
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func create(fileName: String, bundle: Bundle? = Bundle.main, userInteraction: Bool) -> OriginalObjectType{
        let img = UIImage.ys.create(fileName: fileName, bundle: bundle)
        return UIImageView.ys.create(img: img, userInteraction: userInteraction)
    }
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func create(fileName: String, bundle: Bundle? = Bundle.main, target: Any, action: Selector) -> OriginalObjectType{
        let img = UIImage.ys.create(fileName: fileName, bundle: bundle)
        return UIImageView.ys.create(img: img, target: target, action: action)
    }
}
