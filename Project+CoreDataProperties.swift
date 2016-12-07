//
//  Project+CoreDataProperties.swift
//  分帳_期中
//
//  Created by JACK on 2016/12/2.
//  Copyright © 2016年 JACK. All rights reserved.
//

import Foundation
import CoreData


extension Project {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
//        return NSFetchRequest<Project>(entityName: "Project");
//    }

    @NSManaged public var projectName: String
    @NSManaged public var id: Int32

}
