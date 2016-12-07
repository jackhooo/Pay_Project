//
//  ItemTableViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
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
        return project.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "ItemCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        cell.itemLabel.text = project.items[(indexPath as NSIndexPath).row]
        
        cell.tatolPayLabel.text = String(project.itemTotalPay(item: project.items[(indexPath as NSIndexPath).row]))
        
        return cell
    }
    
    // MARK: - Navigation
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showItemDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ItemDetailTableViewController
                destinationController.item = project.items[(indexPath as NSIndexPath).row]
                destinationController.project = project
            }
        }
        else
        {
            super.prepare(for: segue, sender: sender)
        }
        
    }
    
}
