//
//  AddItemViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

var addItemSaveButton = 0

class AddItemViewController: UIViewController {

    @IBOutlet weak var itemNameText: UITextField!
    @IBOutlet weak var itemPriceText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func save(_ sender:UIBarButtonItem) {
        
        //print(date.date.description)
        
        // Validate input fields
        
        if (itemNameText.text == "" || itemPriceText.text == "")
        {
            let alertController = UIAlertController(title: "錯誤", message: "還有未填欄位或錯誤輸入", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        else if (whoPayNum == 0 || whoEatNum == 0)
        {
            let alertController = UIAlertController(title: "錯誤", message: "至少要選擇一名成員", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        else if ( Int(itemPriceText.text!) == nil )
        {
            let alertController = UIAlertController(title: "錯誤", message: "金額請輸入數字", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        var projectNum = 0

        for project in projects{
            
            if(project.projectName == memberItemproject.projectName){
                break
            }
            else{
                projectNum += 1
            }
        }
        
        projects[projectNum].items.append(itemNameText.text!)
        
        for member in  projects[projectNum].members{

            if(projects[projectNum].membersDetail[member] == nil){
                projects[projectNum].membersDetail[member] = []
            }
            
            if( whoPayList[ projects[projectNum].getMemberNum(member: member)] == 1){
                
                projects[projectNum].membersDetail[member]!.append(Int(itemPriceText.text!)!/whoPayNum)
            }
            else{
                projects[projectNum].membersDetail[member]!.append(0)
            }
        }
        
        projects[projectNum].itemsDetail[itemNameText.text!] = whoEatList
        
        addItemSaveButton = 2
        
        whoPayNum = 0
        
        whoEatNum = 0
        
        
        print(projects[projectNum].items)
        print(projects[projectNum].membersDetail)
        print(projects[projectNum].itemsDetail)
        
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }

}
