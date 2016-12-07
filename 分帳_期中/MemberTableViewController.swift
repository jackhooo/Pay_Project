//
//  MemberTableViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberTableViewController: UITableViewController {
    
    var project:ProjectClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project.members.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MemberCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MemberTableViewCell
        
        cell.nameLabel.text = project.members[(indexPath as NSIndexPath).row]
        
        let memberShouldPayOrGet = project.shouldPayOrGet(member: project.members[(indexPath as NSIndexPath).row])
        
        if( memberShouldPayOrGet > 0)
        {
            cell.shouldGetLabel.text = "應得：" + String(memberShouldPayOrGet)
            cell.shouldPayLabel.text = "應付： 0"
        }
        else
        {
            cell.shouldPayLabel.text = "應付：" + String(memberShouldPayOrGet * -1)
            cell.shouldGetLabel.text = "應得： 0"
        }
        
        return cell
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMemberDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MemberDetailTableViewController
                destinationController.member = project.members[(indexPath as NSIndexPath).row]
                destinationController.project = project
            }
        }
        else
        {
            super.prepare(for: segue, sender: sender)
        }        
        
    }
    
}
