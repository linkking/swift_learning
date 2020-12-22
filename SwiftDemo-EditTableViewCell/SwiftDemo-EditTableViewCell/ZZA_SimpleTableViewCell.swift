//
//  ZZA_SimpleTableViewCell.swift
//  SwiftDemo-EditTableViewCell
//
//  Created by zhulei on 2019/5/23.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit
import SnapKit

class ZZA_SimpleTableViewCell: UITableViewCell {

    lazy var leftImageView : UIImageView = {
        let view = UIImageView(frame: CGRect())
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFit

        return view
    }()
    
    lazy var nameLabel : UILabel = {
        let view = UILabel()
        view.textColor = UIColor.gray
        view.textAlignment = NSTextAlignment.left

        return view
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    func makeUI() {
        
        self.contentView.addSubview(leftImageView)
        self.contentView.addSubview(nameLabel)
        
        leftImageView.snp.makeConstraints({ (make) in
            make.size.equalTo(40)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.centerY.equalTo(self.contentView.snp.centerY)
        })
        
        nameLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(self.leftImageView.snp.right).offset(10)
            make.top.bottom.equalTo(self.contentView)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
        }
        
        
    }

}
