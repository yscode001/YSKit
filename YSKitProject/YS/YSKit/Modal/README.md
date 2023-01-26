# YSModal
模态弹框(向上、下、左、右，半屏有遮罩)，常用于操作类弹框

<img src="sample.jpg" width = "300" height = "529" />

## 使用小技巧

### PresentedViewController 使用说明和示例

1、PresentedViewController只需要继承YSModalPresentedVC即可；

2、默认向上弹框，高度为屏高一半，遮罩颜色为黑色，透明度0.5；

3、如果需要自定义方向、长度，遮罩颜色，透明度，重写以下相应的方法即可；

4、如果是UINavigationController，继承YSModalPresentedNavC，用法一样；

```swift
import UIKit

class PresentedVC: YSModalPresentedVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
    
    // 重写此方法，设置遮罩颜色和透明度
    override func setupModalMaskView() -> (maskViewBGC: UIColor, alpha: CGFloat) {
        return (UIColor.black, 0.5)
    }
    
    // 重写此方法，设置弹框方向和长度
    override func setupModalDirectionAndLength() -> (direction: YSModalType, length: CGFloat) {
        return (.toRight, 200)
    }

    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
```

### PresentingViewController 使用说明及示例

1、在需要Modal展现的地方，直接present即可，注意，presentedVC一定是YSModalPresentedVC或YSModalPresentedNavC的子类对象

```swift
import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func modalAction(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = sb.instantiateViewController(withIdentifier: "p") as! YSModalPresentedVC

        // Modal展现
        present(presentedVC, animated: true, completion: nil)
    }
}
```
