//
//  WhoPayViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

var whoPayNum = 0
var whoPayList = Array(repeating: 0, count: memberItemproject.members.count)

class WhoPayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(isEdit == 1){
           
            whoPayList = []
            
            for x in memberItemproject.membersDetail{
            
                if(x.value[memberItemproject.getItemNum(item: toEditItem)]>0)
                {
                    whoPayNum += 1
                    whoPayList.append(1)
                }
                else
                {
                    whoPayList.append(0)
                }
            }

        }
        else
        {
            whoPayList = Array(repeating: 0, count: memberItemproject.members.count)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return memberItemproject.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WhoPayCell", for: indexPath) as! WhoPayCollectionViewCell
        
        //cell.backgroundColor = UIColor(red: 255.0/255.0, green: 192.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        
        if(whoPayList[(indexPath as NSIndexPath).row] == 1)
        {
            cell.backgroundColor = UIColor(red: 242.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 1.0)
        }
        else
        {
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 192.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        }
        
        
        cell.memberLabel.text = memberItemproject.members[(indexPath as NSIndexPath).row]
        
        cell.memberLabel.textColor = UIColor.white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        
        if(cell?.backgroundColor == UIColor(red: 242.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 1.0))
        {
            cell?.backgroundColor = UIColor(red: 255.0/255.0, green: 192.0/255.0, blue: 181.0/255.0, alpha: 1.0)
            
            whoPayNum -= 1
            
            whoPayList[(indexPath as NSIndexPath).row] = 0
        }
        else
        {
            cell?.backgroundColor = UIColor(red: 242.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 1.0)
            
            whoPayNum += 1
            
            whoPayList[(indexPath as NSIndexPath).row] = 1
        }
    }
}
