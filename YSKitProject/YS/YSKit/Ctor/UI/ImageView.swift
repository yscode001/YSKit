//
//  ImageView.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func imgView(img: UIImage?) -> UIImageView{
        return UIImageView(image: img)
    }
    
    static func imgView(img: UIImage?, userInteraction: Bool) -> UIImageView{
        return UIImageView(image: img).ys.then{
            $0.isUserInteractionEnabled = userInteraction
        }
    }
    
    static func imgView(img: UIImage?, target: Any, action: Selector) -> UIImageView{
        return UIImageView(image: img).ys.then{
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        }
    }
}
public extension Ctor{
    
    static func imgView(imgName: String?) -> UIImageView{
        return Ctor.imgView(img: Ctor.img(imgName))
    }
    
    static func imgView(imgName: String?, userInteraction: Bool) -> UIImageView{
        return Ctor.imgView(img: Ctor.img(imgName), userInteraction: userInteraction)
    }
    
    static func imgView(imgName: String?, target: Any, action: Selector) -> UIImageView{
        return Ctor.imgView(img: Ctor.img(imgName), target: target, action: action)
    }
}
public extension Ctor{
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func imgView(fileName: String, bundle: Bundle? = Bundle.main) -> UIImageView{
        return Ctor.imgView(img: Ctor.img(fileName: fileName, bundle: bundle))
    }
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func imgView(fileName: String, bundle: Bundle? = Bundle.main, userInteraction: Bool) -> UIImageView{
        return Ctor.imgView(img: Ctor.img(fileName: fileName, bundle: bundle), userInteraction: userInteraction)
    }
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func imgView(fileName: String, bundle: Bundle? = Bundle.main, target: Any, action: Selector) -> UIImageView{
        return Ctor.imgView(img: Ctor.img(fileName: fileName, bundle: bundle), target: target, action: action)
    }
}
