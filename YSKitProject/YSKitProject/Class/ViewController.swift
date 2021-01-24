//
//  ViewController.swift
//  YSKitProject
//
//  Created by 姚帅 on 2021/1/23.
//

class ViewController: UIViewController {

    private lazy var redV:UIView = UIView.ys.create(bgc: .green).ys.then{
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.ys.addSubviews(redV)
    }
}
