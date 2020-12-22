//
//  ViewController.swift
//  SwiftDemo-LoginAnimation
//
//  Created by zhulei on 2019/5/24.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 129/255.0, green: 216/255.0, blue: 207/255.0, alpha: 1)

        let logoImagaeView = UIImageView(frame: CGRect())
        logoImagaeView.image = UIImage(named: "Rx_Logo_M")
        logoImagaeView.contentMode = .scaleAspectFit
        self.view.addSubview(logoImagaeView)
        
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("LOG IN", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.backgroundColor = .white
        loginBtn.layer.cornerRadius = 8
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        self.view.addSubview(loginBtn)
        
        logoImagaeView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(100)
            make.height.equalTo(200)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(20)
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.height.equalTo(60)
        }
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    @objc func loginBtnClick() {
        
        let loginVC = ZZA_LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: false)
        
    }
}

