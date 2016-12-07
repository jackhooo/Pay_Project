//
//  MemberCost+CoreDataProperties.swift
//  分帳_期中
//
//  Created by JACK on 2016/12/2.
//  Copyright © 2016年 JACK. All rights reserved.
//

import Foundation
import CoreData


extension MemberCost {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemberCost> {
//        return NSFetchRequest<MemberCost>(entityName: "MemberCost");
//    }

    @NSManaged public var id: Int32
    @NSManaged public var cost: Double

}
