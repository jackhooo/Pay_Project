//
//  MemberDetailViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    var project:Project!
    
    var member = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = member + "-各項花費"
        
        let backButton = UIBarButtonItem(title: "",style: UIBarButtonItemStyle.plain,target: nil,action: nil);
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;

        self.navigationController?.navigationBar.isTranslucent = true
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMemberDetailTable" {
            let destinationController = segue.destination as! MemberDetailTableViewController
            destinationController.member = member
            destinationController.project = project
        }
        else
        {
            super.prepare(for: segue, sender: sender)
        }
        
    }
    
}
