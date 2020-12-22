//
//  BViewController.swift
//  SwiftDemo-PresentAnimation
//
//  Created by zhulei on 2019/5/31.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        
        
        let dismissBtn = UIButton(type: .custom)
        dismissBtn.setTitle("DIS MISS", for: .normal)
        dismissBtn.setTitleColor(.red, for: .normal)
        dismissBtn.frame.size = CGSize(width: 100, height: 50)
        dismissBtn.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 200)
        dismissBtn.addTarget(self, action: #selector(dismissBtnClick), for: .touchUpInside)
        self.view.addSubview(dismissBtn)
        
    }
    

    @objc func dismissBtnClick() {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
