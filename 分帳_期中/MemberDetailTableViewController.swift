//
//  MemberDetailTableViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/28.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberDetailTableViewController: UITableViewController {
    
    var project:ProjectClass!
    
    var member = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = member + "-各項花費"
        
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
        return project.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MemberDetailCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MemberDetailTableViewCell

        cell.itemLabel.text = project.items[(indexPath as NSIndexPath).row]
        
        cell.payLabel.text = String(describing: project.membersDetail[member]![(indexPath as NSIndexPath).row])

        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
