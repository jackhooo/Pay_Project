//
//  ViewController.swift
//  UICollectionViewDemoSwift
//
//  Created by Hardik Trivedi on 29/07/2016.
//  Copyright © 2016 iHart. All rights reserved.
//

import UIKit
import TwicketSegmentedControl

class ProjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    var projectsToShow:[Project] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titles = ["進行中", "已完成"]
        let frame = CGRect(x: 0, y: 64, width: view.frame.width, height: 40)
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(titles)
        segmentedControl.defaultTextColor = UIColor.white
        segmentedControl.backgroundColor = UIColor.clear
        segmentedControl.sliderBackgroundColor =  UIColor(red: 242.0/255.0, green: 116.0/255.0, blue: 119.0/255.0, alpha: 0.6)
        segmentedControl.delegate = self
        view.addSubview(segmentedControl)
        
        if(projectsToShow.count == 0){
        
            SetProjectToShow(whichPage: 0)
        }
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return projectsToShow.count
    }
    
    @IBAction func unwindToHomeScreen(_ segue:UIStoryboardSegue) {
        newMemberList = []
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProjectCollectionViewCell
        
        if( (indexPath as NSIndexPath).row % 4 == 3){
            cell.markColor.backgroundColor = UIColor(red: 142.0/255.0, green: 229.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        }
        else if( (indexPath as NSIndexPath).row % 4 == 2){
            cell.markColor.backgroundColor = UIColor(red: 219.0/255.0, green: 112.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        }
        else if( (indexPath as NSIndexPath).row % 4 == 1){
            cell.markColor.backgroundColor = UIColor(red: 255.0/255.0, green: 246.0/255.0, blue: 143.0/255.0, alpha: 1.0)
        }
        else{
            
            cell.markColor.backgroundColor = UIColor(red: 255.0/255.0, green: 192.0/255.0, blue: 181.0/255.0, alpha: 1.0)
        }
        
        cell.projectNameLabel.text = projectsToShow[projectsToShow.count - 1 - (indexPath as NSIndexPath).row].projectName
        
        cell.monthLabel.text = projectsToShow[projectsToShow.count - 1 - (indexPath as NSIndexPath).row].getMonth()
        
        cell.dayLabel.text = projectsToShow[projectsToShow.count - 1 - (indexPath as NSIndexPath).row].date
        
        return cell
    }

    // MARK:- Selected Cell IndexPath
    
    func getIndexPathForSelectedCell() -> IndexPath? {
        
        var indexPath:IndexPath?
        
        if projectCollectionView.indexPathsForSelectedItems!.count > 0 {
        
            indexPath = projectCollectionView.indexPathsForSelectedItems![0]
        }
        return indexPath
    }
    
    //SaveData
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if(addProjectSaveButton == 1)
        {
            SetProjectToShow(whichPage: 0)
            
            projectCollectionView.reloadData()
            
            addProjectSaveButton = 0
        }
    }
    
    func SetProjectToShow(whichPage:Int){
        
        projectsToShow = []
        
        if(whichPage == 0){
            
            for project in projects{
                
                if(project.check == false)
                {
                    projectsToShow.append(project)
                }
            }
        }
        else{
            
            for project in projects{
                
                if(project.check == true)
                {
                    projectsToShow.append(project)
                }
            }
        }
    }

    
    // MARK:- Should Perform Segue
    
    //    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //        return !isEditing
    //    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = getIndexPathForSelectedCell() {
        
            if segue.identifier == "showProject" {
            
                let detailViewController = segue.destination as! MemberItemViewController
                
                detailViewController.project = projectsToShow[projectsToShow.count - 1 - (indexPath as NSIndexPath).row]
                
                print(projectsToShow[projectsToShow.count - 1 - (indexPath as NSIndexPath).row].projectName)
            }
        }
    }
}

extension ProjectViewController: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        
        //print("Selected idex: \(segmentIndex)")
        
        SetProjectToShow(whichPage: segmentIndex)
        
        projectCollectionView.reloadData()
    }
}
