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
var membersDetailList2: [String: [Int]] = [
    "小明": [100, 100, 100],
    "小黑": [0, 0, 0],
    "小黃": [0, 0, 0],
    "小菊": [0, 0, 0],
    "小藍": [0, 0, 0],
]
var membersDetailList3: [String: [Int]] = [
    "小明": [100, 100, 100],
    "小黑": [0, 0, 0],
    "小黃": [0, 0, 0],
    "小菊": [0, 0, 0],
    "小藍": [0, 0, 0],
]
var membersDetailList4: [String: [Int]] = [
    "小明": [100, 100, 100],
    "小黑": [0, 0, 0],
    "小黃": [0, 0, 0],
    "小菊": [0, 0, 0],
    "小藍": [0, 0, 0],
]

var membersList = ["小明","小黑","小黃","小菊","小藍"]
var membersList2 = ["小明","小黑","小黃","小菊","小藍"]
var membersList3 = ["小明","小黑","小黃","小菊","小藍"]
var membersList4 = ["小明","小黑","小黃","小菊","小藍"]

var itemsList = ["章魚燒","臭豆腐","烤鳥蛋"]
var itemsList2 = ["章魚燒","臭豆腐","烤鳥蛋"]
var itemsList3 = ["章魚燒","臭豆腐","烤鳥蛋"]
var itemsList4 = ["章魚燒","臭豆腐","烤鳥蛋"]

var itemsDetailList: [String: [Int]] = [
    "章魚燒": [1, 0, 1, 1, 1],
    "臭豆腐": [1, 1, 0, 1, 1],
    "烤鳥蛋": [1, 1, 1, 0, 1],
]
var itemsDetailList2: [String: [Int]] = [
    "章魚燒": [1, 0, 1, 1, 1],
    "臭豆腐": [1, 1, 0, 1, 1],
    "烤鳥蛋": [1, 1, 1, 0, 1],
]
var itemsDetailList3: [String: [Int]] = [
    "章魚燒": [1, 0, 1, 1, 1],
    "臭豆腐": [1, 1, 0, 1, 1],
    "烤鳥蛋": [1, 1, 1, 0, 1],
]
var itemsDetailList4: [String: [Int]] = [
    "章魚燒": [1, 0, 1, 1, 1],
    "臭豆腐": [1, 1, 0, 1, 1],
    "烤鳥蛋": [1, 1, 1, 0, 1],
]

var projects:[Project] = [
    Project(projectName:"士林夜市",members: membersList, membersDetail: membersDetailList, items: itemsList, check: false, month: 3, date: "03", itemsDetail: itemsDetailList),
    Project(projectName:"師大夜市",members:membersList2, membersDetail: membersDetailList2,items: itemsList2, check: false, month: 4, date: "12", itemsDetail: itemsDetailList2),
    Project(projectName:"寧夏夜市",members:membersList3, membersDetail: membersDetailList3,items: itemsList3, check: false, month: 5, date: "04", itemsDetail: itemsDetailList3),
    Project(projectName:"樂華夜市",members:membersList4, membersDetail: membersDetailList4,items: itemsList4, check: false, month: 6, date: "11", itemsDetail: itemsDetailList4),
    Project(projectName:"逢甲夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 7, date: "15", itemsDetail: itemsDetailList),
    Project(projectName:"花園夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 8, date: "26", itemsDetail: itemsDetailList),
    Project(projectName:"六合夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 9, date: "30", itemsDetail: itemsDetailList),
    Project(projectName:"羅東夜市",members:membersList, membersDetail: membersDetailList,items: itemsList, check: true, month: 10, date: "23", itemsDetail: itemsDetailList)
]
