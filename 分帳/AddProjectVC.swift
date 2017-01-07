//
//  addProjectViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

var addProjectSaveButton = 0

class AddProjectViewController: UIViewController {
    
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var projectNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     @IBAction func save(_ sender:UIBarButtonItem) {
    
        //print(date.date.description)
        
        // Validate input fields
        
        if (projectNameText.text == "" )
        {
            let alertController = UIAlertController(title: "錯誤", message: "還有未填欄位或錯誤輸入", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        else if (newMemberList.count == 0)
        {
            let alertController = UIAlertController(title: "錯誤", message: "至少要有一名成員", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        for project in projects{
            if(project.projectName == projectNameText.text){
                
                let alertController = UIAlertController(title: "錯誤", message: "相同的專案名稱", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
        }
        
        let monthString = String(date.date.description[date.date.description.index(date.date.description.startIndex, offsetBy: 5)]) + String(date.date.description[date.date.description.index(date.date.description.startIndex, offsetBy: 6)])
        
        let month = Int(monthString)
        
        let dayString = String(date.date.description[date.date.description.index(date.date.description.startIndex, offsetBy: 8)]) + String(date.date.description[date.date.description.index(date.date.description.startIndex, offsetBy: 9)])
        
        let newProject = Project(projectName:projectNameText.text!, members: newMemberList, membersDetail: [:], items: [], check: false, month: month!, date: dayString, itemsDetail: [:])
        
        projects.append(newProject)
        
        print(newProject.projectName)
        
        addProjectSaveButton = 1
        
        newMemberList = []
        
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
    }
}
