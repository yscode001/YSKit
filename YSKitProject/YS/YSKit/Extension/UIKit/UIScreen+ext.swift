//
//  UIScreen+ext.swift
//  Alamofire
//
//  Created by yaoshuai on 2021/1/1.
//

import UIKit

public extension YSOriginalProtocol where OriginalType: UIScreen{
    
    static var main:UIScreen{ return UIScreen.main }
    
    static var mainScale:CGFloat{ return main.scale }
    
    static var mainBounds:CGRect{ return main.bounds }
    
    static var mainSize:CGSize{ return mainBounds.size }
    
    static var mainWidth:CGFloat{ return mainSize.width }
    
    static var mainHeight:CGFloat{ return mainSize.height }
}

public extension YSOriginalProtocol where OriginalType: UIScreen{
    
    static var safeArea:UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.last?.safeAreaInsets ?? .zero
        } else {
            return .zero
        }
    }
    
    static var statusBarFrame:CGRect{
        if #available(iOS 13.0, *){
            return UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        } else{
            return UIApplication.shared.statusBarFrame
        }
    }
    
    static var navigationBarHeight:CGFloat { return 44 }
    
    static var tabBarHeight:CGFloat{ return 49 }
}
