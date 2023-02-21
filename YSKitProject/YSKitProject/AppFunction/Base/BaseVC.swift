//
//  BaseVC.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class BaseVC: YSBaseVC{
    
    lazy var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        view.backgroundColor = Color.vc_rootview
    }
    
    deinit{
        Printer.printItem("释放控制器：\(pageName)")
    }
}
