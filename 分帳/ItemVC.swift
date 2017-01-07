//
//  ItemViewController.swift
//  分帳
//
//  Created by JACK on 2016/12/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    var project:Project!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return project.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Itemcell", for: indexPath) as! ItemCollectionViewCell
        
        if( indexPath.row % 4 == 3){
            cell.markColor.backgroundColor = UIColor(red: 142.0/255.0, green: 229.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        }
        else if( indexPath.row % 4 == 2){
            cell.markColor.backgroundColor = UIColor(red: 219.0/255.0, green: 112.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        }
        else if( indexPath.row % 4 == 1){
            cell.markColor.backgroundColor = UIColor(red: 255.0/255.0, green: 246.0/255.0, blue: 143.0/255.0, alpha: 1.0)
        }
        else{
            
            cell.markColor.backgroundColor = UIColor(red: 255.0/255.0, green: 192.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        }

        
        cell.itemNameLabel.text = project.items[(indexPath as NSIndexPath).row]
        
        cell.itemPriceLabel.text = String(project.itemTotalPay(item: project.items[(indexPath as NSIndexPath).row]))

        return cell
    }
    
    //SaveData
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if(addItemSaveButton == 1)
        {
            itemCollectionView.reloadData()
            
            addItemSaveButton = 0
        }
    }

    
    @IBAction func deleteCells(_ sender: AnyObject) {}

}
