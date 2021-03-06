//
//  WhoEatViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

var whoEatNum = 0
var whoEatList = Array(repeating: 0, count: memberItemproject.members.count)

class WhoEatViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var eatCollectionView: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        whoEatNum = 0
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.loadEat(notification:)),name:NSNotification.Name(rawValue: "add"), object: nil)
        
        if(isEdit == 1){
            whoEatList = memberItemproject.itemsDetail[toEditItem]!
            for x in memberItemproject.itemsDetail[toEditItem]!{
                if(x == 1)
                {whoEatNum += 1}
            }
        }
        else
        {
            whoEatList = Array(repeating: 0, count: memberItemproject.members.count)
        }
        
    }
    
    func loadEat(notification: NSNotification){
        
        eatCollectionView.reloadData()
        
        whoEatNum = 0
        
        if(isEdit == 1){
            whoEatList = memberItemproject.itemsDetail[toEditItem]!
            for x in memberItemproject.itemsDetail[toEditItem]!{
                if(x == 1)
                {whoEatNum += 1}
            }
        }
        else
        {
            whoEatList = Array(repeating: 0, count: memberItemproject.members.count)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WhoEatCell", for: indexPath) as! WhoEatCollectionViewCell
        
        //print(memberItemproject.members)
        
        if(whoEatList[(indexPath as NSIndexPath).row] == 1)
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
            
            whoEatNum -= 1
            whoEatList[(indexPath as NSIndexPath).row] = 0
        }
        else
        {
            cell?.backgroundColor = UIColor(red: 242.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 1.0)
            
            whoEatNum += 1
            whoEatList[(indexPath as NSIndexPath).row] = 1
        }
    }
}
