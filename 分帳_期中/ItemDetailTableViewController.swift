//
//  ItemDetailTableViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/28.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class ItemDetailTableViewController: UITableViewController {
    
    var project:ProjectClass!
    
    var item = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = item + "-成員花費"
        
        let backButton = UIBarButtonItem(title: "",style: UIBarButtonItemStyle.plain,target: nil,action: nil);
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
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

        let cellIdentifier = "ItemDetailCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemDetailTableViewCell
        
        cell.memberLabel.text = project.members[(indexPath as NSIndexPath).row]
        
        cell.memberPayLabel.text = String(describing: project.membersDetail[project.members[(indexPath as NSIndexPath).row]]![project.itemNum(item: item)])

        return cell
    }
}
