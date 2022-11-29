//
//  UIImage+ext.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit

public extension YSOriginalProtocol where OriginalType: UIImage{
    
    var width:CGFloat{
        return originalObj.size.width
    }
    
    var height:CGFloat{
        return originalObj.size.height
    }
}

public extension YSOriginalProtocol where OriginalType: UIImage{
    
    /// 颜色填充
    func tint(_ color: UIColor) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(originalObj.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else{
            UIGraphicsEndImageContext()
            return nil
        }
        guard let cgImg = originalObj.cgImage else{
            UIGraphicsEndImageContext()
            return nil
        }
        
        context.translateBy(x: 0, y: originalObj.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        
        context.setBlendMode(.normal)
        context.draw(cgImg, in: rect)
        
        context.setBlendMode(.sourceIn)
        color.setFill()
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

public extension YSOriginalProtocol where OriginalType: UIImage{
    
    var size_jpeg_kb: Int{
        guard let data = originalObj.jpegData(compressionQuality: 1) else{
            return 0
        }
        let data_ns = NSData(data: data)
        return Int(CGFloat(data_ns.length) / 1024.0)
    }
    
    var size_png_kb: Int{
        guard let data = originalObj.pngData() else{
            return 0
        }
        let data_ns = NSData(data: data)
        return Int(CGFloat(data_ns.length) / 1024.0)
    }
}

public extension YSOriginalProtocol where OriginalType: UIImage{
    
    /// 等比例缩放
    func scale(width: CGFloat) -> UIImage{
        if width <= 0{
            return originalObj
        }
        
        let scaleHeight = width / originalObj.size.width * originalObj.size.height
        let scaleSize = CGSize(width: width, height: scaleHeight)
        
        UIGraphicsBeginImageContextWithOptions(scaleSize, false, 0)
        originalObj.draw(in: CGRect(origin: CGPoint.zero, size: scaleSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let iimg = image{
            return iimg
        }
        return originalObj
    }
    
    /// 质量压缩，虽然有误差范围，但实际很难确定图片是否能压缩到误差范围内，无法实现精确压缩
    ///
    /// - Parameters:
    ///   - aim: 目标质量最大值(单位：KB)
    ///   - accuracy: 误差范围(单位：KB)
    ///   - scaleWidth: 目标尺寸
    /// - Returns: 压缩后的图片
    func compress(_ aim: Int, accuracy: Int? = 3, scaleWidth: CGFloat? = 0) -> Data?{
        var image:UIImage?
        if scaleWidth! > 0 && scaleWidth! < width{
            image = scale(width: scaleWidth!)
        }
        guard let data = image?.jpegData(compressionQuality: 1) else{
            return nil
        }
        // 目标值
        if aim <= 0{
            return nil
        }
        let aimLength = aim * 1024
        var accuracyLength = 3072
        if accuracy! > 3{
            accuracyLength = accuracy! * 1024
        }
        
        // 开始计算
        var data_ns = NSData(data: data)
        if data_ns.length <= aimLength + accuracyLength{
            return data
        }
        
        var maxQuality:CGFloat = 1
        var minQuality:CGFloat = 0
        var flag = 0
        
        while true {
            let midQuality = (maxQuality + minQuality) * 0.5
            guard let d = image?.jpegData(compressionQuality: midQuality) else{
                return nil
            }
            if flag >= 10{ // 都10次了，不少了，返回吧
                return d
            }
            flag += 1
            
            data_ns = NSData(data: d)
            if data_ns.length > aimLength + accuracyLength{
                maxQuality = midQuality
                continue
            } else if data_ns.length < aimLength - accuracyLength{
                minQuality = midQuality
                continue
            } else{
                return d
            }
        }
    }
}
