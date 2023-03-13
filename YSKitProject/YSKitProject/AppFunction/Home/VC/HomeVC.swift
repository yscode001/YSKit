//
//  HomeVC.swift
//  YSKitProject
//
//  Created by 姚帅 on 2023/1/6.
//

class HomeVC: BaseVC{
    
    private lazy var usernameTF: UITextField = Ctor.textField(bgColor: .lightGray, textColor: .darkGray, clearMode: .always, borderStyle: .roundedRect, placeholder: "请输入用户名")
    
    private lazy var passwordTF: UITextField = Ctor.textField(bgColor: .lightGray, textColor: .darkGray, clearMode: .always, borderStyle: .roundedRect, placeholder: "请输入密码")
    
    private lazy var previewLbl: UILabel = Ctor.label(textColor: .darkGray).ys.then{ $0.textAlignment = .center }
    
    private lazy var submitBtn: UIButton = Ctor.btn(titleColor: .darkGray, title: "提 交").ys.then{ $0.backgroundColor = .lightGray }
    private lazy var cancelBtn: UIButton = Ctor.btn(titleColor: .darkGray, title: "取 消").ys.then{ $0.backgroundColor = .lightGray }
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
        bindEvents()
    }
    
    private func setupUI(){
        view.ys.addSubviews(usernameTF, passwordTF, previewLbl, submitBtn, cancelBtn)
        usernameTF.snp.makeConstraints { make in
            make.top.equalTo(200)
            make.leading.equalTo(80)
            make.trailing.equalTo(-80)
            make.height.equalTo(40)
        }
        passwordTF.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(usernameTF)
            make.top.equalTo(usernameTF.snp.bottom).offset(20)
        }
        previewLbl.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(usernameTF)
            make.top.equalTo(passwordTF.snp.bottom).offset(20)
        }
        submitBtn.snp.makeConstraints { make in
            make.top.equalTo(previewLbl.snp.bottom).offset(50)
            make.leading.height.equalTo(usernameTF)
            make.trailing.equalTo(view.snp.centerX).offset(-30)
        }
        cancelBtn.snp.makeConstraints { make in
            make.top.height.equalTo(submitBtn)
            make.leading.equalTo(view.snp.centerX).offset(30)
            make.trailing.equalTo(usernameTF)
        }
    }
    
    private func bindEvents(){
      
    }
}
