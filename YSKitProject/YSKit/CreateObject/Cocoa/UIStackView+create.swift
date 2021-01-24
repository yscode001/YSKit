//
//  UIStackView+create.swift
//  YSKit
//
//  Created by yaoshuai on 2021/1/20.
//

import UIKit

public extension YSOriginalObjectProtocol where OriginalObjectType == UIStackView{
    
    static func create(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> OriginalObjectType{
        return UIStackView().ys.then{
            $0.axis = axis
            $0.distribution = distribution
            $0.alignment = alignment
        }
    }
    
    static func create(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, arrangedSubviews: [UIView]) -> OriginalObjectType{
        return UIStackView(arrangedSubviews: arrangedSubviews).ys.then{
            $0.axis = axis
            $0.distribution = distribution
            $0.alignment = alignment
        }
    }
}
