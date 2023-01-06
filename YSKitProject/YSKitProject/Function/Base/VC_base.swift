//
//  VC_base.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class VC_base: YSBaseVC{
    
    lazy var diaposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.vc_rootview
    }
    
    deinit{
        Printer.print("释放控制器：\(pageName)")
    }
}
