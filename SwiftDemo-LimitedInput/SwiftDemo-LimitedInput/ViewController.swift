//
//  ViewController.swift
//  SwiftDemo-LimitedInput
//
//  Created by zhulei on 2019/5/31.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    
    var limitedTextView : UITextView!
    var numLabel : UILabel!
    
    let maxText = 50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Limited Input"
        
        limitedTextView = UITextView(frame: CGRect(x: 30, y: 100, width: self.view.frame.width-60, height: 200))
        limitedTextView.font = UIFont.systemFont(ofSize: 20)
        limitedTextView.delegate = self
        limitedTextView.layer.cornerRadius = 10
        limitedTextView.layer.borderWidth = 1
        limitedTextView.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(limitedTextView)
        
        
        numLabel = UILabel(frame: CGRect(x: 0, y: 300 , width: self.view.frame.width - 30, height: 50))
        numLabel.textAlignment = .right
        numLabel.textColor = .black
        numLabel.font = UIFont.systemFont(ofSize: 30)
        numLabel.text = "\(maxText)"
        self.view.addSubview(numLabel)
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        limitedTextView.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextLength = text.count - range.length + textView.text.count
        if inputTextLength > maxText {
            return false
        }
        numLabel.text = "\(maxText - inputTextLength)"
        return true
    }

}

