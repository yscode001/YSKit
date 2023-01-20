//
//  BaseVC.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class BaseVC: YSBaseVC{
    
    lazy var diaposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.vc_rootview
    }
    
    deinit{
        PrintTool.print("释放控制器：\(pageName)")
    }
}
