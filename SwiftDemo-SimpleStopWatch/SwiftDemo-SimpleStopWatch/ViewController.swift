//
//  ViewController.swift
//  SwiftDemo-SimpleStopWatch
//
//  Created by zhulei on 2019/5/20.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var resetBtn = UIButton(type: .custom)
    lazy var showlabel = UILabel()
    lazy var startBtn = UIButton()
    lazy var endBtn = UIButton()
    
    var timer : Timer!
    var labelNum:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(showlabel)
        self.view.addSubview(resetBtn)
        self.view.addSubview(startBtn)
        self.view.addSubview(endBtn)
        
        resetBtn.setTitle("RESET", for: .normal)
        resetBtn.setTitleColor(.white, for: .normal)
        resetBtn.addTarget(self, action: #selector(resetBtnClick), for: .touchUpInside)
        resetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(44)
            make.width.equalTo(60)
        }
        
        showlabel.backgroundColor = UIColor.colorWithHex(rgb: 0xf8cf5f)
        showlabel.textAlignment = .center
        showlabel.font = UIFont.systemFont(ofSize: 40)
        showlabel.text = "0"
        showlabel.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(350)
        }
        
        startBtn.backgroundColor = UIColor.colorWithHex(rgb: 0xce594b)
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.setTitle("START", for: .normal)
        startBtn.addTarget(self, action: #selector(startBtnClick), for: .touchUpInside)
        startBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.showlabel.snp.bottom)
            make.left.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.5)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        endBtn.backgroundColor = UIColor.colorWithHex(rgb: 0x4c9f67)
        endBtn.setTitleColor(.white, for: .normal)
        endBtn.setTitle("END", for: .normal)
        endBtn.addTarget(self, action: #selector(endBtnClick), for: .touchUpInside)
        endBtn.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.startBtn)
            make.left.equalTo(self.startBtn.snp.right)
            make.right.equalTo(self.view)
        }
        

    }

    
    @objc func resetBtnClick() {
        self.labelNum = 0
        self.showlabel.text = "0"
        self.endBtnClick()
    }
    
    @objc func startBtnClick() {
        if self.timer != nil {
            self.endBtnClick()
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.labelNum += 0.1
            self.showlabel.text = String(format: "%0.1f", self.labelNum)
        })
    }
    
    @objc func endBtnClick() {
        guard let timer = self.timer else {
            return
        }
        timer.invalidate()
    }

}



extension UIColor {
    // 16进制 转 RGBA
    class func colorWithHexA(rgb:Int, alpha: CGFloat) ->UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    //16进制 转 RGB
    class func colorWithHex(rgb:Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}
