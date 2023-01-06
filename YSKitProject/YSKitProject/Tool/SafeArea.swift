//
//  SafeArea.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

enum Type_safeArea{
    case top
    case bottom
    case left
    case right
}

class SafeArea{
    
    class func area(type: Type_safeArea) -> CGFloat{
        var val: CGFloat = 0
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                switch type{
                case .top: val = window.safeAreaInsets.top
                case .bottom: val = window.safeAreaInsets.bottom
                case .left: val =  window.safeAreaInsets.left
                case .right: val =  window.safeAreaInsets.right
                }
            }
        }
        return val
    }
}
