//
//  UIImage+create.swift
//  YSKit
//
//  Created by 姚帅 on 2020/12/30.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIImage{
    
    /// 从Assets中加载图片
    static func create(_ named: String?) -> OriginalObjectType?{
        guard let name = named else {
            return nil
        }
        return UIImage(named: name)
    }
    
    /// 创建纯色图片
    static func create(color: UIColor, size: CGSize) -> OriginalObjectType?{
        if size.width <= 0 || size.height <= 0{
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else{
            UIGraphicsEndImageContext()
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    /// 创建一个圆角矩形的图片(矩形内是指定颜色，四个角是透明色)
    static func create(color: UIColor, size: CGSize, cornerRadius: CGFloat) -> OriginalObjectType?{
        if size.width <= 0 || size.height <= 0{
            return nil
        }
        let maxCorner = min(size.width, size.height) * 0.5
        var corner = cornerRadius
        if cornerRadius < 0{
            corner = 0
        } else if cornerRadius > maxCorner{
            corner = maxCorner
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: corner)
        color.setFill()
        path.fill()
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    /// 从bundle(默认Bundle.main)中加载图片，适用于大图片，且使用率低
    static func create(fileName: String, bundle: Bundle? = Bundle.main) -> OriginalObjectType?{
        guard let path = bundle?.path(forResource: fileName, ofType: nil) else{
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
}

// MARK: - 生成二维码、条形码
public extension YSOriginalObjectProtocol where OriginalObjectType == UIImage{
    
    /// 生成二维码
    static func createQRCode(code: String, width: CGFloat, height: CGFloat) -> OriginalObjectType?{
        if width <= 0 || height <= 0{
            return nil
        }
        
        // 1、创建滤镜：CIQRCodeGenerator
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else{
            return nil
        }
        
        // 2、设置属性：先设置默认、再设置自定义选项
        filter.setDefaults()
        filter.setValue(code.data(using: .utf8), forKey: "inputMessage")
        
        // 3、根据滤镜生成图片
        guard var ciImage = filter.outputImage else{
            return nil
        }
        
        // 4、设置缩放，要不模糊
        let scaleX = width / ciImage.extent.size.width
        let scaleY = height / ciImage.extent.size.height
        ciImage = ciImage.transformed(by: CGAffineTransform.identity.scaledBy(x: scaleX, y: scaleY))
        
        return UIImage(ciImage: ciImage)
    }
    
    /// 生成条形码
    static func createBarCode(code: String, width: CGFloat, height: CGFloat) -> OriginalObjectType?{
        if width <= 0 || height <= 0{
            return nil
        }
        
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else{
            return nil
        }
        
        filter.setDefaults()
        filter.setValue(code.data(using: .utf8), forKey: "inputMessage")
        
        guard var ciImage = filter.outputImage else{
            return nil
        }
        
        let scaleX = width / ciImage.extent.size.width
        let scaleY = height / ciImage.extent.size.height
        
        ciImage = ciImage.transformed(by: CGAffineTransform.identity.scaledBy(x: scaleX, y: scaleY))
        
        return UIImage(ciImage: ciImage)
    }
}
