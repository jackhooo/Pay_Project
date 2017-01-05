//
//  ViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberItemViewController: UIViewController {
    
    var project:Project!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
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
        
                
        self.navigationController?.navigationBar.isTranslucent = true
        self.automaticallyAdjustsScrollViewInsets = false
        
        let backButton = UIBarButtonItem(
            title: "",
            style: UIBarButtonItemStyle.plain,
            target: nil,
            action: nil
        );
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        
        firstView.isHidden = false
        secondView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
        
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMember" {
            let destinationController = segue.destination as! MemberViewController
            destinationController.project = project
        }
        
        if segue.identifier == "showItem" {
            let destinationController = segue.destination as! ItemViewController
            destinationController.project = project
        }
    }    
}
