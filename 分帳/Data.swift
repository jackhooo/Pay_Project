//
//  File.swift
//  分帳
//
//  Created by JACK on 2017/1/4.
//  Copyright © 2017年 JACK. All rights reserved.
//

import Foundation

var membersDetailList: [String: [Int]] = [
    "小明": [100, 100, 100],
    "小黑": [0, 0, 0],
    "小黃": [0, 0, 0],
    "小菊": [0, 0, 0],
    "小藍": [0, 0, 0],
]

var membersList = ["小明","小黑","小黃","小菊","小藍"]

var itemsList = ["章魚燒","臭豆腐","烤鳥蛋"]

var itemsDetailList: [String: [Int]] = [
    "章魚燒": [1, 0, 1, 1, 1],
    "臭豆腐": [1, 1, 0, 1, 1],
    "烤鳥蛋": [1, 1, 1, 0, 1],
]

var projects:[Project] = [
    Project(projectName:"士林夜市",members: membersList, membersDetail: membersDetailList, items: itemsList, check: false, month: 12, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"饒河街夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: false, month: 11, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"a夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: false, month: 1, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"b夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: false, month: 2, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"c夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 3, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"d夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 4, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"e夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 5, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"f夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 6, date: "03", itemsDetail: itemsDetailList)
]
