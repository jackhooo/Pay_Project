//
//  Project.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import Foundation

class ProjectClass {
    
    var projectName = ""
    var members = [String]()
    var membersDetail: [String: [Int]] = [:]
    var items = [String]()
    
    init( projectName:String, members: [String], membersDetail:[String:[Int]], items:[String] ){
        
        self.projectName = projectName
        self.members = members
        self.membersDetail = membersDetail
        self.items = items
    }
    
    func shouldPayOrGet ( member: String ) -> Int {
        
        var eachPay = 0
        var itemTotal = 0
        var sum = 0
        
        for eachItemNum in 0..<items.count {
        
            itemTotal = itemTotalPay(item: items[eachItemNum]) / members.count
            
            eachPay = membersDetail[member]![eachItemNum] - itemTotal
            
            sum += eachPay
            
        }
        
        return sum
    }
    
    func itemNum ( item: String ) -> Int {
        
        for eachItemNum in 0..<items.count {
            
            if item == items[eachItemNum]
            {return eachItemNum}
        }
        
        return -1
    }
    
    func itemTotalPay ( item: String) -> Int{
    
        var sum = 0
        
        for memberNum in 0..<members.count {
            
            sum += (membersDetail[members[memberNum]]?[itemNum(item: item)])!
            
        }
        
        return sum
    }
}
