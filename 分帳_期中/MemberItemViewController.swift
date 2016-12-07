//
//  ViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberItemViewController: UIViewController {
    
    var project:ProjectClass!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var firstView: UITableView!
    @IBOutlet weak var secondView: UITableView!
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = project.projectName
        
        firstView.isHidden = false
        secondView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showMember" {
            
            let destinationController = segue.destination as! MemberTableViewController
            destinationController.project = project
        }
        
        if segue.identifier == "showItem" {
            
            let destinationController = segue.destination as! ItemTableViewController
            destinationController.project = project
        }
    }
}
