public enum YSModalEnum {
    
    /// 自下而上
    case toTop(length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat)
    
    /// 自上而下
    case toBottom(length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat)
    
    /// 自右而左
    case toLeft(length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat)
    
    /// 自左而右
    case toRight(length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat)
    
    case middleCenterFadeIn(width: CGFloat, height: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat)
    
    /// 默认方向模态类型
    public static var defaultDirectionModalEnum: YSModalEnum{
        return .toTop(length: UIScreen.main.bounds.size.height * 0.5, maskViewBackgroundColor: .black, maskViewAlpha: 0.5)
    }
    
    /// 默认中心点淡入模态类型
    public static var defaultMiddleCenterFadeInEnum: YSModalEnum{
        return .middleCenterFadeIn(width: 300, height: 500, maskViewBackgroundColor: .black, maskViewAlpha: 0.5)
    }
}

extension YSModalEnum {
    
    /// 是否是方向模态
    internal var isDirectionModal: (isDirectionModal: Bool, length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat){
        switch self{
        case .toTop(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        case .toBottom(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        case .toLeft(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        case .toRight(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        default:
            return (false, 0, .clear, 0)
        }
    }
    
    /// 是否是上下方向的方向模态
    internal var isDirectionToTopOrBottomModal: (isDirectionToTopOrBottomModal: Bool, length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat){
        switch self{
        case .toTop(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        case .toBottom(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        default:
            return (false, 0, .clear, 0)
        }
    }
    
    /// 是否是左右方向的方向模态
    internal var isDirectionToLeftOrRightModal: (isDirectionToLeftOrRightModal: Bool, length: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat){
        switch self{
        case .toLeft(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        case .toRight(length: let length, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, length, maskViewBackgroundColor, maskViewAlpha)
        default:
            return (false, 0, .clear, 0)
        }
    }
    
    /// 是否是中心点淡入模态类型
    internal var isMiddleCenterFadeInModal: (isMiddleCenterFadeInModal: Bool, width: CGFloat, height: CGFloat, maskViewBackgroundColor: UIColor, maskViewAlpha: CGFloat){
        switch self{
        case .middleCenterFadeIn(width: let width, height: let height, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (true, width, height, maskViewBackgroundColor, maskViewAlpha)
        default:
            return (false, 0, 0, .clear, 0)
        }
    }
    
    /// 遮罩视图的背景色和透明度
    internal var maskViewBackgroundColorAndAlpha: (backgroundColor: UIColor, alpha: CGFloat){
        switch self{
        case .toTop(length: _, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (maskViewBackgroundColor, maskViewAlpha)
        case .toBottom(length: _, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (maskViewBackgroundColor, maskViewAlpha)
        case .toLeft(length: _, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (maskViewBackgroundColor, maskViewAlpha)
        case .toRight(length: _, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (maskViewBackgroundColor, maskViewAlpha)
        case .middleCenterFadeIn(width: _, height: _, maskViewBackgroundColor: let maskViewBackgroundColor, maskViewAlpha: let maskViewAlpha):
            return (maskViewBackgroundColor, maskViewAlpha)
        }
    }
}
