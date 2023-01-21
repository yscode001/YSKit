//
//  HomeVC.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class HomeVC: BaseVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.present(AA(), animated: true)
        })
    }
}

class AA:YSModal_presentedVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
