//
//  AddProjectTableViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/28.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit
import CoreData

class AddProjectTableViewController: UITableViewController {
    
    @IBOutlet var projectNameTextField:UITextField!
    
    @IBOutlet var memberNameOneTextField:UITextField!
    @IBOutlet var memberNameTwoTextField:UITextField!
    @IBOutlet var memberNameThreeTextField:UITextField!
    
    @IBOutlet var memberOnePayOneTextField:UITextField!
    @IBOutlet var memberTwoPayOneTextField:UITextField!
    @IBOutlet var memberThreePayOneTextField:UITextField!
    
    @IBOutlet var memberOnePayTwoTextField:UITextField!
    @IBOutlet var memberTwoPayTwoTextField:UITextField!
    @IBOutlet var memberThreePayTwoTextField:UITextField!
    
    @IBOutlet var itemNameOneTextField:UITextField!
    @IBOutlet var itemNameTwoTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func save(_ sender:UIBarButtonItem) {
        
        let myProjectEntityName = "Project"
        let myMemberEntityName = "Member"
        let myItemEntityName = "Item"
        let myMemberCostEntityName = "MemberCost"
        
        let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let coreDataConnect = CoreDataConnect(context: myContext)
        
        let projectName = projectNameTextField.text
        let memberName1 = memberNameOneTextField.text
        let memberName2 = memberNameTwoTextField.text
        let memberName3 = memberNameThreeTextField.text
        
        let member1Pay1 = memberOnePayOneTextField.text
        let member2Pay1 = memberTwoPayOneTextField.text
        let member3Pay1 = memberThreePayOneTextField.text
        
        let member1Pay2 = memberOnePayTwoTextField.text
        let member2Pay2 = memberTwoPayTwoTextField.text
        let member3Pay2 = memberThreePayTwoTextField.text
        
        let itemName1 = itemNameOneTextField.text
        let itemName2 = itemNameTwoTextField.text
        
        
        // auto increment
        let myUserDefaults = UserDefaults.standard
        var seq = 1
        if let idSeq = myUserDefaults.object(forKey: "idSeq") as? Int {
            seq = idSeq + 1
        }
        
        // Validate input fields
        
        // SameName
        if ( memberName1 == memberName2 || memberName1 == memberName3 || memberName2 == memberName3 )
        {
            let alertController = UIAlertController(title: "錯誤", message: "相同名字", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        else if ( projectName == "" || itemName1 == "" || itemName2 == "" || Double(member1Pay1!) == nil || Double(member1Pay2!) == nil || Double(member2Pay1!) == nil || Double(member2Pay2!) == nil || Double(member3Pay1!) == nil || Double(member3Pay2!) == nil || memberName1 == nil || memberName2 == nil || memberName3 == nil )
        {
            let alertController = UIAlertController(title: "錯誤", message: "還有未填欄位或錯誤輸入", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        //insert
        
        let insertProjectName = coreDataConnect.insert(
            myProjectEntityName, attributeInfo: [
                "id" : "\(seq)",
                "projectName" : "\(projectName!)"
            ])
        
        let insertMember1 = coreDataConnect.insert(
            myMemberEntityName, attributeInfo: [
                "id" : "\(seq)",
                "name" : "\(memberName1!)"
            ])
        
        let insertMember2 = coreDataConnect.insert(
            myMemberEntityName, attributeInfo: [
                "id" : "\(seq)",
                "name" : "\(memberName2!)"
            ])
        
        let insertMember3 = coreDataConnect.insert(
            myMemberEntityName, attributeInfo: [
                "id" : "\(seq)",
                "name" : "\(memberName3!)"
            ])
        
        let insertItem1 = coreDataConnect.insert(
            myItemEntityName, attributeInfo: [
                "id" : "\(seq)",
                "name" : "\(itemName1!)"
            ])
        
        let insertItem2 = coreDataConnect.insert(
            myItemEntityName, attributeInfo: [
                "id" : "\(seq)",
                "name" : "\(itemName2!)"
            ])
        
        let insertMember1Cost1 = coreDataConnect.insert(
            myMemberCostEntityName, attributeInfo: [
                "id" : "\(seq)",
                "cost" : "\(Double(member1Pay1!)!)"
            ])
        
        let insertMember1Cost2 = coreDataConnect.insert(
            myMemberCostEntityName, attributeInfo: [
                "id" : "\(seq)",
                "cost" : "\(Double(member1Pay2!)!)"
            ])
        
        let insertMember2Cost1 = coreDataConnect.insert(
            myMemberCostEntityName, attributeInfo: [
                "id" : "\(seq)",
                "cost" : "\(Double(member2Pay1!)!)"
            ])
        
        
        let insertMember2Cost2 = coreDataConnect.insert(
            myMemberCostEntityName, attributeInfo: [
                "id" : "\(seq)",
                "cost" : "\(Double(member2Pay2!)!)"
            ])
        
        let insertMember3Cost1 = coreDataConnect.insert(
            myMemberCostEntityName, attributeInfo: [
                "id" : "\(seq)",
                "cost" : "\(Double(member3Pay1!)!)"
            ])
        
        let insertMember3Cost2 = coreDataConnect.insert(
            myMemberCostEntityName, attributeInfo: [
                "id" : "\(seq)",
                "cost" : "\(Double(member3Pay2!)!)"
            ])
        
        if ( insertProjectName && insertMember1 && insertMember2 && insertMember3 && insertItem1 && insertItem2 && insertMember1Cost1 && insertMember1Cost2 && insertMember2Cost1 && insertMember2Cost2 && insertMember3Cost1 && insertMember3Cost2 )
        {
            print("新增資料成功\(seq)")
            myUserDefaults.set(seq, forKey: "idSeq")
            myUserDefaults.synchronize()
            saveButton = 1
        }
        
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
