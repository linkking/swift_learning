//
//  ViewController.swift
//  SwiftDemo-EditTableViewCell
//
//  Created by zhulei on 2019/5/23.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    var dataArray : NSMutableArray = [
        simpleData(name: "心如止水", imageName: "recommend"),
        simpleData(name: "归去来兮", imageName: "like"),
        simpleData(name: "晚安", imageName: "star"),
        simpleData(name: "我曾", imageName: "star"),
        simpleData(name: "Monsters", imageName: "like"),
        simpleData(name: "Lemon", imageName: "recommend"),
        simpleData(name: "像我这样的人", imageName: "like"),
        simpleData(name: "I Am You", imageName: "star"),
        simpleData(name: "Counting Sheep", imageName: "recommend"),
        simpleData(name: "Everything I Need", imageName: "star")
    ]
    
    var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的歌单"
        
        addSubViews()
    }

    func addSubViews(){
        myTableView = UITableView.init(frame: CGRect(), style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        self.view.addSubview(myTableView)
        
        myTableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        myTableView.register(ZZA_SimpleTableViewCell.self, forCellReuseIdentifier: "simpleCellIdentifier")
    }
    
    
    //MARK: - dataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleCellIdentifier", for: indexPath) as! ZZA_SimpleTableViewCell
        
        let item = dataArray[indexPath.row]
        
        cell.nameLabel.text = (item as! simpleData).name
        cell.leftImageView.image = UIImage(named: (item as! simpleData).imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    
    //MARK: - delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "delete") { (action, index) in
            
            print("delete")
            self.dataArray.removeObject(at: index.row)
            self.myTableView.reloadData()
            
            
        }
        
        let editAction = UITableViewRowAction(style: .default, title: "edit") { (action, index) in
            self.myTableView.isEditing = true
        }
        editAction.backgroundColor = .blue
        
        return [deleteAction,editAction]
    }
    
    
    //MARK:- move
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        dataArray.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
        self.myTableView.isEditing = false
        
    }
    
}

