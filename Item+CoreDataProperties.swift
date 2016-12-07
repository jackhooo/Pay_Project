//
//  Item+CoreDataProperties.swift
//  分帳_期中
//
//  Created by JACK on 2016/12/2.
//  Copyright © 2016年 JACK. All rights reserved.
//

import Foundation
import CoreData


extension Item {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
//        return NSFetchRequest<Item>(entityName: "Item");
//    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String

}
