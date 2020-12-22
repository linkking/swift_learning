//
//  ViewController.swift
//  SwiftDemo-StretchyHeader
//
//  Created by zhulei on 2019/5/15.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var emptyView:UIView!
    var imageView:UIImageView!
    
    var dataArray = ["我的收藏","我的评论","浏览历史","设置"]
    var originalFrame : CGRect?
    var navH : CGFloat = UIScreen.main.bounds.height >= 812 ? 88 :64
    
    private let cellIdentifier = "cellIdentifier"
    private let cellHeight : CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stretchy Header"
        
        imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 150))
        imageView.image = UIImage(named: "zza_person_info")
//        imageView.contentMode = .scaleAspectFit
        originalFrame = imageView.frame
        
        
        emptyView = UIView.init(frame:imageView.frame)
        emptyView.backgroundColor = .clear
        
        tableView = UITableView.init(frame: CGRect(x: 0, y: navH, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = emptyView
        self.view.addSubview(tableView)
        
        self.tableView.addSubview(imageView)
        
        if #available(iOS 11.0, *){
            self.tableView.contentInsetAdjustmentBehavior = .never
            self.tableView.estimatedRowHeight = 0
            self.tableView.estimatedSectionFooterHeight = 0
            self.tableView.estimatedSectionHeaderHeight = 0
        }
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if(offsetY <= 0 ){
            if let frame = originalFrame{
                //一种下拉形变
                let needOffsetY = (offsetY + scrollView.contentInset.top) * -1
                let y = needOffsetY * -1
                let height = frame.size.height + needOffsetY
                imageView.frame = CGRect(x: frame.origin.x, y: y, width: frame.size.width, height: height)
                //第二种下拉形变
//                let needOffsetY = (offsetY + scrollView.contentInset.top) * -1
//                let y = needOffsetY * -1
//                let height = frame.size.height + needOffsetY
//                let width = height / 0.3
//                let x = (width - frame.size.width) * -0.5
//                imageView.frame = CGRect(x: x, y: y, width: width, height: height)
            }
        }
        
    }
}
