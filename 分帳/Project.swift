//
//  Project.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import Foundation

class Project {
    
    var projectName = ""
    var members = [String]()
    var membersDetail: [String: [Int]] = [:]
    var items = [String]()
    var month: Int!
    var date: String!
    var check: Bool!
    
    init( projectName:String, members: [String], membersDetail:[String:[Int]], items:[String], check: Bool,month: Int, date: String){
        
        self.date = date
        self.month = month
        self.check = check
        self.projectName = projectName
        self.members = members
        self.membersDetail = membersDetail
        self.items = items
    }
    
    func getMonth() -> String {
        
        switch month {
        case 1:
            return "JAN"
        case 2:
            return "FEB"
        case 3:
            return "MAR"
        case 4:
            return "APR"
        case 5:
            return "MAY"
        case 6:
            return "JUN"
        case 7:
            return "JUL"
        case 8:
            return "AUG"
        case 9:
            return "SEP"
        case 10:
            return "OCT"
        case 11:
            return "NOV"
        case 12:
            return "DEC"
        default:
            return ""
        }
    }
    
    func payed( member: String ) -> Int {
        
        var eachPay = 0
        var sum = 0
        
        for eachItemNum in 0..<items.count {
            
            eachPay = membersDetail[member]![eachItemNum]
            
            sum += eachPay
            
        }
        
        return sum
    }
    
    func spend( member: String ) -> Int {
        
        var itemTotal = 0
        var sum = 0
        
        for eachItemNum in 0..<items.count {
            
            itemTotal = itemTotalPay(item: items[eachItemNum]) / members.count
            
            sum += itemTotal
        }
        
        return sum
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
    
    func itemEachShouldPay( itemNum: Int ) -> Int {
        
        var eachPay = 0
        
        eachPay = itemTotalPay(item: items[itemNum]) / members.count
        
        return eachPay
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
