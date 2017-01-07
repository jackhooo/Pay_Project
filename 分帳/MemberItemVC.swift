//
//  ViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

var memberItemproject:Project!

class MemberItemViewController: UIViewController {
    
    var project:Project!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberItemproject = project
        
       // print(memberItemproject.projectName)

        self.navigationController?.navigationBar.isTranslucent = true
        self.automaticallyAdjustsScrollViewInsets = false
        
        let backButton = UIBarButtonItem(
            title: "",
            style: UIBarButtonItemStyle.plain,
            target: nil,
            action: nil
        );
        
         navigationItem.title = project.projectName
        
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        
        firstView.isHidden = false
        secondView.isHidden = true
        
        let titles = ["成員", "項目"]
        let frame = CGRect(x: 0, y: 64, width: view.frame.width, height: 40)
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(titles)
        segmentedControl.defaultTextColor = UIColor.white
        segmentedControl.backgroundColor = UIColor.clear
        segmentedControl.sliderBackgroundColor =  UIColor(red: 242.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 0.6)
        segmentedControl.delegate = self
        view.addSubview(segmentedControl)
        
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

extension MemberItemViewController: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        
        switch segmentIndex
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
        
        //print("Selected idex: \(segmentIndex)")
    }
}

