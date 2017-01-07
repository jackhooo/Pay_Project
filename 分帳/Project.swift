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
    var itemsDetail: [String: [Int]] = [:]
    var month: Int!
    var date: String!
    var check: Bool!
    
    init( projectName:String, members: [String], membersDetail:[String:[Int]], items:[String], check: Bool,month: Int, date: String, itemsDetail: [String: [Int]] ){
        
        self.itemsDetail = itemsDetail
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
    
    func getItemNum ( item: String ) -> Int {
        
        for eachItemNum in 0..<items.count {
            
            if item == items[eachItemNum]
            {return eachItemNum}
        }
        
        return -1
    }
    
    func getMemberNum ( member: String ) -> Int {
        
        for eachMemberNum in 0..<members.count {
            
            if member == members[eachMemberNum]
            {return eachMemberNum}
        }
        
        return -1
    }
    
    func itemTotalPay ( item: String) -> Int{
        
        var sum = 0
        
        for memberNum in 0..<members.count {
            
            sum += (membersDetail[members[memberNum]]?[getItemNum(item: item)])!
        }
        
        return sum
    }
    
    func payed( member: String ) -> Int {
        
        var sum = 0
        
        if(membersDetail.count != 0){
           
            for eachPrice in membersDetail[member]! {
                
                sum += eachPrice
                
            }
            
            return sum
        }
        else{
            return 0
        }
    }
    
    func spend( member: String ) -> Int {
        
        var sum = 0
        
        for list in itemsDetail{
            if(list.value[getMemberNum(member: member)] == 1){
                sum += itemEachShouldPay(item: list.key, member: member)
            }
        }
        
        return sum
    }
    
    func shouldPayOrGet ( member: String ) -> Int {
        
        return payed(member: member) - spend(member: member)
    }
    
    func getMemberSpentItemNum( member: String ) -> Int {
        
        var memberSpentItemNum = 0
        
        for list in itemsDetail{
            if(list.value[getMemberNum(member: member)] == 1){
                memberSpentItemNum += 1
            }
        }
        
        return memberSpentItemNum
    }
    
    func getMemberShouldPayNum(item:String) -> Int{
        
        var memberShouldPayNum = 0
        
        for member in itemsDetail[items[getItemNum(item: item)]]!{
            if(member == 1){
                memberShouldPayNum += 1
            }
        }
        
        return memberShouldPayNum
    }
    
    func itemEachShouldPay( item: String, member: String) -> Int {
        
        var eachPay = 0
        
        eachPay = itemTotalPay(item: item) / getMemberShouldPayNum(item:item)
        
        if(itemsDetail[item]?[getMemberNum(member: member)] == 0){
            return 0
        }
        else{
            return eachPay
        }
    }
}
