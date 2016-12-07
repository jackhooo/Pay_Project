//
//  ProjectTableViewController.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit
import CoreData

var saveButton = 0

class ProjectTableViewController: UITableViewController {
    
    let myProjectEntityName = "Project"
    let myMemberEntityName = "Member"
    let myItemEntityName = "Item"
    let myMemberCostEntityName = "MemberCost"
    
    let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var projects:[Project]!
    var members:[Member]!
    var items:[Item]!
    var memberCosts:[MemberCost]!
    
    var projectDatas:[ProjectClass]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(
            title: "",
            style: UIBarButtonItemStyle.plain,
            target: nil,
            action: nil
        );
        
        copyFromCoreData()
        
        projectDatas = setProjectData()
        
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
        return projects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProjectCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = projects[(indexPath as NSIndexPath).row].projectName
        
        return cell
    }
    
    @IBAction func unwindToHomeScreen(_ segue:UIStoryboardSegue) {}
    
    //SetProjectData
    
    func setProjectData() -> [ProjectClass] {
        
        var tempProjectDatas :[ProjectClass]!
        
        var projectNum = 0
        
        tempProjectDatas = []
        
        for project in projects{
            
            var tempMembersDetailList:[String: [Int]] = [:]
            
            var tempMembersList:[String] = []
            
            var tempItemsList:[String] = []
            
            for member in members{
                
                if(member.id == project.id)
                {
                    tempMembersList.append(member.name)
                }
            }
            
            for item in items{
                
                if( item.id == project.id)
                {
                    tempItemsList.append(item.name)
                }
            }
            
            var nowMember = -1
            
            var memberShouldBe = 0
            
            for member in members{
                
                if( member.id == project.id)
                {
                    var nowItemNum = 0
                    
                    var nowItemNumForMember = 0
                    
                    for memberCost in memberCosts{
                        
                        if( nowItemNumForMember == memberShouldBe*items.count )
                        {
                            nowMember = memberShouldBe
                        }
                        
                        nowItemNumForMember += 1
                        
                        if( memberCost.id == project.id && nowMember == memberShouldBe )
                        {
                            if( tempMembersDetailList[member.name] == nil )
                            {
                                tempMembersDetailList[member.name] = []
                            }
                            
                            tempMembersDetailList[member.name]?.append(Int(memberCost.cost))
                            
                            nowItemNum += 1
                        }
                        
                        if( nowItemNum == tempItemsList.count )
                        {
                            nowMember = -1
                            
                            memberShouldBe += 1
                            
                            break
                        }
                    }
                }
            }
            
            print(tempMembersDetailList)
            
            tempProjectDatas.append( ProjectClass(projectName: project.projectName, members: tempMembersList, membersDetail: tempMembersDetailList, items: tempItemsList) )
            
            projectNum+=1
        }
        
        return tempProjectDatas
    }
    
    //CopyFromCoreData
    
    func copyFromCoreData(){
        
        let coreDataConnect = CoreDataConnect(context: myContext)
        
        let selectResult = coreDataConnect.retrieve(myProjectEntityName, predicate: nil, sort: [["id":true]], limit: nil)
        if let results = selectResult  {
            self.projects = results as! [Project]
        }
        
        let selectMemberResult = coreDataConnect.retrieve(myMemberEntityName, predicate: nil, sort: [["id":true]], limit: nil)
        if let results = selectMemberResult   {
            self.members = results as! [Member]
        }
        
        let selectItemResult = coreDataConnect.retrieve(myItemEntityName, predicate: nil, sort: [["id":true]], limit: nil)
        if let results = selectItemResult {
            self.items = results as! [Item]
        }
        
        let selectMemberCostResult = coreDataConnect.retrieve(myMemberCostEntityName, predicate: nil, sort: [["id":true]], limit: nil)
        if let results = selectMemberCostResult  {
            self.memberCosts = results as! [MemberCost]
        }
    }
    
    //SaveData
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if(saveButton == 1)
        {
            copyFromCoreData()
            
            projectDatas = setProjectData()
            
            self.tableView.reloadData()
            
            saveButton = 0
        }
    }
    
    //Delete
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let coreDataConnect = CoreDataConnect(context: myContext)
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            let deleteID = self.projects[(indexPath as NSIndexPath).row].id
            
            let predicate = "id = \(deleteID)"
            
            let deleteProjectNameResult = coreDataConnect.delete(self.myProjectEntityName, predicate: predicate)
            var deleteMemberResult = coreDataConnect.delete(self.myMemberEntityName, predicate: predicate)
            var deleteItemResult = coreDataConnect.delete(self.myItemEntityName, predicate: predicate)
            var deleteMemberCostResult = coreDataConnect.delete(self.myMemberCostEntityName, predicate: predicate)
            
            for _ in self.members
            {
                deleteMemberResult = coreDataConnect.delete(self.myMemberEntityName, predicate: predicate)
            }
            
            for _ in self.items
            {
                deleteItemResult = coreDataConnect.delete(self.myItemEntityName, predicate: predicate)
            }
            
            for _ in self.memberCosts
            {
                deleteMemberCostResult = coreDataConnect.delete(self.myMemberCostEntityName, predicate: predicate)
            }
            
            if deleteItemResult && deleteMemberResult && deleteMemberCostResult && deleteProjectNameResult{
                
                print("刪除資料成功\(deleteID)")
                
                self.copyFromCoreData()
                
                self.projectDatas = self.setProjectData()
                
                self.tableView.reloadData()
            }
            }
        )
        
        // Set the button color
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction]
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showProject" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MemberItemViewController
                destinationController.project = projectDatas[(indexPath as NSIndexPath).row]
            }
        }
        else
        {
            super.prepare(for: segue, sender: sender)
        }
    }
    
}
