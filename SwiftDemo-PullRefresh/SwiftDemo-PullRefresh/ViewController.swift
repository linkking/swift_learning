//
//  ViewController.swift
//  SwiftDemo-PullRefresh
//
//  Created by zhulei on 2019/5/9.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let cellIdentifier = "cellIdentifier"
    var myTableView:UITableView!
    var dataArray = Array<String>()
    let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Pull Refresh"
        
        dataArray = ["fish","milk","eggs","apples"]
        addMyTableView()
        addRefreshControl()
        
    }
    
    func addMyTableView() {
        myTableView = UITableView(frame: self.view.bounds, style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        self.view.addSubview(myTableView)
        
        myTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        
    }
    
    func addRefreshControl() {
        refresh.backgroundColor = UIColor.gray
        refresh.attributedTitle = NSAttributedString(string: "Last update on:\(currentTime())", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.white])
        refresh.tintColor = UIColor.white
        myTableView.refreshControl = refresh
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: UIControl.Event.valueChanged)
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    //MARK: - private method
    @objc func pullTheRefresh() {
        addNewDataToArray()
        refresh.endRefreshing()
        myTableView.reloadData()
    }
    
    func addNewDataToArray() {
        let newData = ["beef😁","bread😅","chicken💝","sweets🔥"]
        dataArray.append(newData[Int(arc4random_uniform(UInt32(newData.count)))])
    }
    
    func currentTime() -> String {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return df.string(from: Date())
    }
}

