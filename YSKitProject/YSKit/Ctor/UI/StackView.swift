//
//  StackView.swift
//  YSKit
//
//  Created by 姚帅 on 2022/11/29.
//

import UIKit

public extension Ctor{
    
    static func stackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> UIStackView{
        return UIStackView().ys.then{
            $0.axis = axis
            $0.distribution = distribution
            $0.alignment = alignment
        }
    }
    
    static func stackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, arrangedSubviews: [UIView]) -> UIStackView{
        return UIStackView(arrangedSubviews: arrangedSubviews).ys.then{
            $0.axis = axis
            $0.distribution = distribution
            $0.alignment = alignment
        }
    }
}
