//
//  addMemberViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

var newMemberList: [String] = []

class AddMemberViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var member: UICollectionView!
    @IBOutlet weak var memberText: UITextField!
    @IBOutlet weak var memberLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addMember(_ sender:UIBarButtonItem) {
        
        
        if ( memberText.text == "" )
        {
            let alertController = UIAlertController(title: "錯誤", message: "請輸入成員名稱", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        for member in newMemberList{
            
            if ( memberText.text == member )
            {
                let alertController = UIAlertController(title: "錯誤", message: "相同名字", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "繼續", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
        }
        
        newMemberList.append(memberText.text!)
        
        memberText.text = ""
        
        member.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return newMemberList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddMemberCell", for: indexPath) as! AddMemberCollectionViewCell
        
        cell.backgroundColor = UIColor(red: 255.0/255.0, green: 192.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        cell.memberLabel.text = newMemberList[(indexPath as NSIndexPath).row]
        cell.memberLabel.textColor = UIColor.white
        
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
