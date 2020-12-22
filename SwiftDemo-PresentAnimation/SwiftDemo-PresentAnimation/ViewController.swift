//
//  ViewController.swift
//  SwiftDemo-PresentAnimation
//
//  Created by zhulei on 2019/5/31.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIViewControllerTransitioningDelegate {

    var transition = BTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let animationBtn = UIButton(type: .custom)
        animationBtn.setTitle("PRESENT", for: .normal)
        animationBtn.setTitleColor(.red, for: .normal)
        animationBtn.frame.size = CGSize(width: 100, height: 50)
        animationBtn.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 200)
        animationBtn.addTarget(self, action: #selector(animationBtnClick), for: .touchUpInside)
        self.view.addSubview(animationBtn)
        
        
        let normalBtn = UIButton(type: .custom)
        normalBtn.setTitle("NORMAL", for: .normal)
        normalBtn.setTitleColor(.red, for: .normal)
        normalBtn.frame.size = CGSize(width: 100, height: 50)
        normalBtn.center = CGPoint(x: self.view.center.x, y: self.view.center.y )
        normalBtn.addTarget(self, action: #selector(normalBtnBtnClick), for: .touchUpInside)
        self.view.addSubview(normalBtn)
        
    }
    
    @objc func animationBtnClick() {
        print("normal click ")
        let BVC = BViewController()
        BVC.transitioningDelegate = self
        self.present(BVC, animated: true, completion: nil)
    }

    
    @objc func normalBtnBtnClick() {
        print("normal click ")
        let norVC = NormalViewController()
        self.present(norVC, animated: true, completion: nil)
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.AnimaionType = .Present
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.AnimaionType = .Dismiss
        return transition
    }
    
    
    
}

