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
    @IBOutlet weak var memberNameText: UITextField!
    
    var projectNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for project in projects{
            
            if(project.projectName == memberItemproject.projectName){
                break
            }
            else{
                projectNum += 1
            }
        }
        
        if(isEdit == 1){
            itemNameText.text = toEditItem
            itemPriceText.text = String(memberItemproject.itemTotalPay(item: toEditItem))
        }
    }
    
    @IBAction func addMember(_ sender: AnyObject) {
        
        if (memberNameText.text == "")
        {
            let alertController = UIAlertController(title: "錯誤", message: "請輸入名字", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        for member in projects[projectNum].members{
            if(memberNameText.text == member){
                let alertController = UIAlertController(title: "錯誤", message: "相同的名字", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        }
        
        projects[projectNum].members.append(memberNameText.text!)
        
        projects[projectNum].membersDetail[memberNameText.text!] = []
        
        projects[projectNum].membersDetail[memberNameText.text!] = Array(repeating: 0, count: projects[projectNum].items.count)
        
        for item in  projects[projectNum].items{
            
            projects[projectNum].itemsDetail[item]!.append(0)
        }
        
        memberItemproject = projects[projectNum]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "add"), object: nil)
        
        memberNameText.text = ""
        
        print(memberItemproject.members)
        print(memberItemproject.items)
        print(memberItemproject.membersDetail)
        print(memberItemproject.itemsDetail)
    }

    
    @IBAction func save(_ sender:UIBarButtonItem) {
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
        
        if(isEdit == 0){
            
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
            
            
            print(projects[projectNum].items)
            print(projects[projectNum].membersDetail)
            print(projects[projectNum].itemsDetail)
        }
        else{
            
            print(projects[projectNum].items[projects[projectNum].getItemNum(item: toEditItem)])
            
            projects[projectNum].items[projects[projectNum].getItemNum(item: toEditItem)] = itemNameText.text!
            
            for member in  projects[projectNum].members{
                
                if(projects[projectNum].membersDetail[member] == nil){
                    projects[projectNum].membersDetail[member] = []
                }
                
                if( whoPayList[projects[projectNum].getMemberNum(member: member)] == 1){
                    
                    projects[projectNum].membersDetail[member]![projects[projectNum].getItemNum(item: toEditItem)] = Int(itemPriceText.text!)! / whoPayNum
                }
                else{
                    projects[projectNum].membersDetail[member]![projects[projectNum].getItemNum(item: toEditItem)] = 0
                }
            }
            
            if(toEditItem != itemNameText.text!)
            {
                projects[projectNum].itemsDetail.removeValue(forKey:toEditItem)
            }
            
            projects[projectNum].itemsDetail[itemNameText.text!] = []
            
            projects[projectNum].itemsDetail[itemNameText.text!] = whoEatList
            
            print(projects[projectNum].items)
            print(projects[projectNum].membersDetail)
            print(projects[projectNum].itemsDetail)
        }
        
        addItemSaveButton = 2
        
        whoPayNum = 0
        
        whoEatNum = 0
        
        isEdit = 0
        
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
    
}
