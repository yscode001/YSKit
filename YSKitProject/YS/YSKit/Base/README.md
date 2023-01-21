# 常用基类
我们提供了基于ViewController、Cell的简单基类，为了解耦，里面仅仅增加了非常简单的扩展方法，使用时直接继承重写即可。当然，即使继承了，你也可以完全实现自己基于原生的功能，平时怎么写现在还怎么写，不影响。

## 控制器基类：YSBaseVC 
~~~ swift
// YSBase提供了以下几个快捷方法，使用时直接重写即可
// 使用时，super调不调用无所谓，基类中反正也是空实现
class MyClass: YSBaseVC {
    
    override func viewDidAppear(firstTime: Bool) {
        
    }
    
    override func viewWillAppear(firstTime: Bool) {
        
    }
    
    override func viewWillLayoutSubviews(firstTime: Bool) {
        
    }
    
    override func viewDidLayoutSubviews(firstTime: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(firstTime: Bool) {
        
    }
    
    override func viewDidDisappear(firstTime: Bool) {
        
    }
}

~~~

## Cell基类
1. YSBaseCell_colv
2. YSBaseCell_colv_headerFooter
3. YSBaseCell_tbv_default
4. YSBaseCell_tbv_subtitle
5. YSBaseCell_tbv_value1
6. YSBaseCell_tbv_value2

这6个基类使用时，都是一样的，我们只举1例：
~~~ swift
// 使用时，super调不调用无所谓，基类中反正也是空实现
class MyCell: YSBaseCell_tbv_default {
    
    /// 设置属性
    override func setupProperty() {
        
    }
    
    /// 设置UI
    override func setupUI() {
        
    }
}

~~~