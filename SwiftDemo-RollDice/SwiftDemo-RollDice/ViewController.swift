//
//  ViewController.swift
//  SwiftDemo-RollDice
//
//  Created by zhulei on 2019/5/8.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var rollLabel:UILabel!
    var rollBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addMyViews()
    }

    func addMyViews() {
        rollLabel = UILabel.init(frame: CGRect.init(x: 40, y: 300, width: self.view.frame.width - 80, height: 100))
        rollLabel.textColor = UIColor.red
        rollLabel.textAlignment = NSTextAlignment.center
        rollLabel.font = UIFont.systemFont(ofSize: 80)
        rollLabel.text = "1"
        self.view.addSubview(rollLabel)
        
        rollBtn = UIButton.init(type: UIButton.ButtonType.custom)
        rollBtn.frame = CGRect.init(x: 20, y: self.view.frame.height - 200, width: self.view.frame.width - 40, height: 50)
        rollBtn.setTitle("Roll The Dice", for: UIControl.State.normal)
        rollBtn.setTitleColor(UIColor.red, for: UIControl.State.normal)
        rollBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        rollBtn.addTarget(self, action: #selector(rollBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(rollBtn)
        
        
    }
    
    @objc func rollBtnClick() {
        
        let rollNum = Int.randomIntNumber(lower: 1, upper: 7)
        rollLabel.text = String(rollNum)
    }
    
    
}

