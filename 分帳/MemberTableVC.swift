//
//  MemberTableViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberTableViewController: UITableViewController {
    
    var project:Project!

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

    @IBAction func unwindToHomeScreen(_ segue:UIStoryboardSegue) {}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MemberCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MemberTableViewCell
        
        let memberShouldPayOrGet = project.shouldPayOrGet(member: project.members[(indexPath as NSIndexPath).row])

        let memberPayed = project.payed(member: project.members[(indexPath as NSIndexPath).row])
        
        let memberSpend = project.spend(member: project.members[(indexPath as NSIndexPath).row])
        
        cell.memberNameLabel.text = project.members[(indexPath as NSIndexPath).row]
        
        cell.memberPayed.text = String(memberPayed)
        
        cell.memberShouldPay.text = String(memberSpend)
        
        cell.memberTotal.textColor = UIColor.white
        
        if( memberShouldPayOrGet > 0 ){
            cell.memberTotal.backgroundColor = UIColor(red: 24.0/255.0, green: 206.0/255.0, blue: 179.0/255.0, alpha: 0.8)
            cell.memberTotal.text = String(memberShouldPayOrGet)
        }
        else{
            cell.memberTotal.backgroundColor = UIColor(red: 238.0/255.0, green: 121.0/255.0, blue: 159.0/255.0, alpha: 0.8)
            cell.memberTotal.text = String(memberShouldPayOrGet * -1)
        }
        
        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMemberDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MemberDetailViewController
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
