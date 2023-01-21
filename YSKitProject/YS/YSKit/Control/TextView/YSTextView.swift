//
//  YSTextView.swift
//  Pods
//
//  Created by yaoshuai on 2020/12/25.
//

import UIKit

public class YSTextView: UITextView {
    
    // 要监听的属性
    // 监听text是因为TextDidChange通知监听不到setText
    private lazy var listen_propertys = ["font", "text", "textAlignment"]
    
    /// 最小高度
    private lazy var minHeight:CGFloat = 0
    
    /// 最大高度
    private lazy var maxHeight:CGFloat = 0
    
    /// 高度变化之后的回调
    private var heightChanged:((CGFloat) -> ())?
    
    /// 文字改变之前的高度
    private lazy var priorHeight:CGFloat = -1
    
    private lazy var placeHolderLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.lightGray
        lbl.font = self.font ?? UIFont.systemFont(ofSize: 12)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    public override var font: UIFont?{
        didSet{
            if font != nil{
                placeHolderLabel.font = font!
            }
        }
    }
    
    public override var textAlignment: NSTextAlignment{
        didSet{
            placeHolderLabel.textAlignment = textAlignment
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: nil)
        alwaysBounceVertical = true
        keyboardDismissMode = .onDrag
        init_listen()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        alwaysBounceVertical = true
        keyboardDismissMode = .onDrag
        init_listen()
    }
    
    deinit {
        for property in listen_propertys{
            removeObserver(self, forKeyPath: property)
        }
    }
}

extension YSTextView{
    
    private func init_listen(){
        NotificationCenter.default.addObserver(self, selector: #selector(textViewTextChanged), name: UITextView.textDidChangeNotification, object: nil)
        for property in listen_propertys{
            addObserver(self, forKeyPath: property, options: .new, context: nil)
        }
        
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeHolderLabel)
        
        addConstraint(NSLayoutConstraint(item: placeHolderLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: placeHolderLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: placeHolderLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -10))
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        textViewTextChanged()
    }
    
    @objc private func textViewTextChanged(){
        placeHolderLabel.isHidden = hasText
        autoHeight()
    }
    
    private func autoHeight(){
        if minHeight >= maxHeight || minHeight <= 0 || maxHeight <= 0{
            return
        }
        
        let newHeight = sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude)).height
        if newHeight == priorHeight{
            return
        }
        
        if newHeight < minHeight{
            if frame.size.height != minHeight{
                frame.size.height = minHeight
                isScrollEnabled = false
                heightChanged?(minHeight)
                priorHeight = minHeight
            }
        } else if minHeight <= newHeight && newHeight <= maxHeight{
            if frame.size.height != newHeight{
                frame.size.height = newHeight
                isScrollEnabled = false
                heightChanged?(newHeight)
                priorHeight = newHeight
            }
        } else{
            if frame.size.height != maxHeight{
                frame.size.height = maxHeight
                isScrollEnabled = true
                heightChanged?(maxHeight)
                priorHeight = maxHeight
            }
        }
    }
}

// MARK: - 对外开放API
extension YSTextView{
    
    /// 设置placeHolder
    ///
    /// - Parameters:
    ///   - placeHolder: 内容
    ///   - color: 颜色
    func setPlaceHolder(placeHolder: String?, textColor: UIColor?){
        self.placeHolderLabel.text = placeHolder
        self.placeHolderLabel.textColor = textColor ?? UIColor.lightGray
    }
    
    /// 高度随内容自适应，注意min一定要和约束高度相同
    ///
    /// - Parameters:
    ///   - minValue: 最小高度，一定要和约束高度相同
    ///   - maxValue: 最大高度
    func setHeight(min minValue: CGFloat, max maxValue: CGFloat){
        self.minHeight = max(minValue, 0)
        self.maxHeight = max(maxValue, 0)
    }
    
    /// 高度随内容改变了，然后回调
    ///
    /// - Parameter then: 回调闭包
    func setHeightChangedCallback(complete: @escaping((CGFloat) -> ())){
        self.heightChanged = complete
    }
}
