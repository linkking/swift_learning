//
//  ZZA_LoginViewController.swift
//  SwiftDemo-LoginAnimation
//
//  Created by zhulei on 2019/5/24.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class ZZA_LoginViewController: UIViewController {

    
    lazy var userNameField : UITextField = {
        let field = UITextField()
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.placeholder = "UserName"
        return field
    }()

    lazy var passwordField : UITextField = {
        let field = UITextField()
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.placeholder = "Password"
        return field
    }()

    lazy var loginBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 8
        btn.backgroundColor = UIColor(red: 217/255.0, green: 0/255.0, blue: 122/255.0, alpha: 1)
        return btn
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航和标题相关
        makeNavigationAndTitle()
        
        makeSubViews()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        performMyAnimations()
        
    }
    
    deinit {
        print("ZZA_LoginViewController deinit")
    }
    
    
    func makeNavigationAndTitle() {
        self.view.backgroundColor = UIColor(red: 129/255.0, green: 216/255.0, blue: 207/255.0, alpha: 1)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let leftBtn = UIButton(type: .custom)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftBtn.setImage(UIImage(named: "back-icon"), for: .normal)
        leftBtn.addTarget(self, action: #selector(goback), for: .touchUpInside)
        
        let leftBarBtn = UIBarButtonItem(customView: leftBtn)
        
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        self.title = "Welecom"
    }

    @objc func goback() {
        self.navigationController?.popViewController(animated: true)
    }

    
    func makeSubViews() {
        
        self.view.addSubview(userNameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(loginBtn)
        
        userNameField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(30 + 400)
            make.right.equalTo(self.view.snp.right).offset(-30 + 400)
            make.top.equalTo(self.view.snp.top).offset(200)
            make.height.equalTo(40)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.equalTo(self.userNameField.snp.bottom).offset(30)
            make.left.equalTo(self.view.snp.left).offset(30 + 400)
            make.right.equalTo(self.view.snp.right).offset(-30 + 400)

        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.equalTo(self.passwordField.snp.bottom).offset(30)
            make.left.equalTo(self.view.snp.left).offset(30 + 400)
            make.right.equalTo(self.view.snp.right).offset(-30 + 400)
        }
        
        
    }
    
    func performMyAnimations() {
        
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.userNameField.snp.updateConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(30)
                make.right.equalTo(self.view.snp.right).offset(-30)
            })
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.passwordField.snp.updateConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(30)
                make.right.equalTo(self.view.snp.right).offset(-30)
            })
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: .curveEaseOut, animations: {
            self.loginBtn.snp.updateConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(30)
                make.right.equalTo(self.view.snp.right).offset(-30)
            })
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
            
    }

}
