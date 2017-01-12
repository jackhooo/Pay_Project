//
//  MemberDetailTableViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberDetailTableViewController: UITableViewController {
    
    var project:Project!
    
    var member = ""
    
    //var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return setItems().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MemberDetailCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MemberDetailTableViewCell
        
        let itemTotal = project.membersDetail[member]![project.getItemNum(item: setItems()[(indexPath as NSIndexPath).row])] - project.itemEachShouldPay(item:setItems()[(indexPath as NSIndexPath).row], member: member)
        
        cell.itemNameLabel.text = setItems()[(indexPath as NSIndexPath).row]
        
        cell.itemPayed.text = String(describing: project.membersDetail[member]![project.getItemNum(item: setItems()[(indexPath as NSIndexPath).row])])
        
        cell.itemShouldPay.text = String(project.itemEachShouldPay(item:setItems()[(indexPath as NSIndexPath).row], member: member))
        
        cell.itemTotal.textColor = UIColor.white
        
        if( itemTotal > 0){
            cell.itemTotal.backgroundColor = UIColor(red: 24.0/255.0, green: 206.0/255.0, blue: 179.0/255.0, alpha: 0.8)
            cell.itemTotal.text = String(itemTotal)
        }
        else{
            cell.itemTotal.backgroundColor = UIColor(red: 238.0/255.0, green: 121.0/255.0, blue: 159.0/255.0, alpha: 0.8)
            cell.itemTotal.text = String(itemTotal * -1)
        }
        
        return cell
    }
    
    func setItems() -> Array<String>{
        
        var items = [String]()
        
        for list in project.itemsDetail{
            if(list.value[project.getMemberNum(member: member)]==1){
                items.append(list.key)
            }
            else if(list.value[project.getMemberNum(member: member)] == 0 && project.membersDetail[member]![project.getItemNum(item: list.key)] > 0)
            {
                items.append(list.key)
            }
        }
        
        return items
    }
}
