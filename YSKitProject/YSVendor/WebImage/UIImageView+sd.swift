//
//  UIImageView+sd.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import SDWebImage
import YSKit

// MARK: - 利用三方库(SD)显示图片
public extension YSOriginalProtocol where OriginalType: UIImageView{
    
    func setImage(_ url: String?, ph: UIImage?){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObj.image = ph
            return
        }
        originalObj.sd_setImage(with: requestURL, placeholderImage: ph)
    }
    
    func setImage(_ url: String?, ph: UIImage?, complete: @escaping((UIImage?) -> ())){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObj.image = ph
            complete(ph)
            return
        }
        originalObj.sd_setImage(with: requestURL, placeholderImage: ph, options: .retryFailed) { (img, _, _, _) in
            complete(img)
        }
    }
    
    func setImage(_ url: String?, phName: String?){
        setImage(url, ph: UIImage(named: phName ?? ""))
    }
    
    func setImage(_ url: String?, phName: String?, complete: @escaping((UIImage?) -> ())){
        setImage(url, ph: UIImage(named: phName ?? ""), complete: complete)
    }
}

// MARK: - 调整后图片副本的标识
public extension YSOriginalProtocol where OriginalType: UIImageView{
    
    /// 圆角副本存储标识
    private func radiusCopySaveKey(url: String?, radius: CGFloat, hasBorder: Bool) -> String{
        let has = hasBorder ? "hasBorder" : "hasNoBorder"
        let w = Int(originalObj.bounds.width)
        let h = Int(originalObj.bounds.height)
        let r = Int(radius)
        let u = url ?? ""
        return "\(transformContentModel_rawString)_\(has)_\(w)_\(h)_\(r)_\(u)"
    }
    
    private var transformContentModel_rawString: String{
        switch transformContentModel {
        case .fill:
            return "SDImageScaleModeFill"
        case .aspectFit:
            return "SDImageScaleModeAspectFit"
        case .aspectFill:
            return "SDImageScaleModeAspectFill"
        default:
            return "SDImageScaleModeAspectFit"
        }
    }
    
    private var transformContentModel: SDImageScaleMode{
        switch originalObj.contentMode {
        case .scaleToFill:
            return .fill
        case .scaleAspectFit:
            return .aspectFit
        case .scaleAspectFill:
            return .aspectFill
        default:
            return .aspectFit
        }
    }
}

// MARK: - 利用三方库(SD)显示图片，并切圆角
public extension YSOriginalProtocol where OriginalType: UIImageView{
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - ph: 占位图片
    ///   - size: 图片控件的尺寸
    ///   - radius: 圆角值
    func setImage(_ url: String?, ph: UIImage?, size: CGSize, radius: CGFloat){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObj.image = ph?.sd_resizedImage(with: size, scaleMode: transformContentModel)?.sd_roundedCornerImage(withRadius: radius, corners: .allCorners, borderWidth: 0, borderColor: nil)
            return
        }
        if let img = SDImageCache.shared.imageFromCache(forKey: radiusCopySaveKey(url: url, radius: radius, hasBorder: false)){
            originalObj.image = img
            return
        }
        originalObj.sd_setImage(with: requestURL, placeholderImage: ph, options: .avoidDecodeImage, progress: nil) { [weak originalObj]  (originalImage, _, _, _) in
            guard let `originalObject` = originalObj else{ return }
            if let originalImg = originalImage{
                let transormImg = originalImg.sd_resizedImage(with: size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: radius, corners: .allCorners, borderWidth: 0, borderColor: nil)
                originalObject.image = transormImg
                SDImageCache.shared.store(transormImg, forKey: self.radiusCopySaveKey(url: url, radius: radius, hasBorder: false), completion: nil)
            } else{
                originalObject.image = ph?.sd_resizedImage(with: size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: radius, corners: .allCorners, borderWidth: 0, borderColor: nil)
            }
        }
    }
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - phName: 占位图片
    ///   - size: 图片控件的尺寸
    ///   - radius: 圆角值
    func setImage(_ url: String?, phName: String?, size: CGSize, radius: CGFloat){
        setImage(url, ph: UIImage(named: phName ?? ""), size: size, radius: radius)
    }
}

// MARK: - 利用三方库(SD)显示图片，切圆角，并带边框
public extension YSOriginalProtocol where OriginalType: UIImageView{
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - ph: 占位图片
    ///   - size: 图片控件的尺寸
    ///   - radius: 圆角值
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func setImage(_ url: String?, ph: UIImage?, size: CGSize, radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObj.image = ph?.sd_resizedImage(with: size, scaleMode: transformContentModel)?.sd_roundedCornerImage(withRadius: radius, corners: .allCorners, borderWidth: borderWidth, borderColor: borderColor)
            return
        }
        if let img = SDImageCache.shared.imageFromCache(forKey: radiusCopySaveKey(url: url, radius: radius,hasBorder: true)){
            originalObj.image = img
            return
        }
        originalObj.sd_setImage(with: requestURL, placeholderImage: ph, options: .avoidDecodeImage, progress: nil) { [weak originalObj]  (originalImage, _, _, _) in
            guard let `originalObject` = originalObj else{ return }
            if let originalImg = originalImage{
                let transormImg = originalImg.sd_resizedImage(with: size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: radius, corners: .allCorners, borderWidth: borderWidth, borderColor: borderColor)
                originalObject.image = transormImg
                SDImageCache.shared.store(transormImg, forKey: self.radiusCopySaveKey(url: url, radius: radius,hasBorder: true), completion: nil)
            } else{
                originalObject.image = ph?.sd_resizedImage(with: size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: radius, corners: .allCorners, borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - phName: 占位图片
    ///   - size: 图片控件的尺寸
    ///   - radius: 圆角值
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func setImage(_ url: String?, phName: String?, size: CGSize, radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor){
        setImage(url, ph: UIImage(named: phName ?? ""), size: size, radius: radius, borderWidth: borderWidth, borderColor: borderColor)
    }
}

// MARK: - 取消当前图片的加载
public extension YSOriginalProtocol where OriginalType: UIImageView{
    
    /// 取消当前图片的加载
    func cancelCurrentImageLoad(){
        originalObj.sd_cancelCurrentImageLoad()
    }
}
