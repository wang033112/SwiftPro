//
//  DammyData.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/07.
//

import Foundation

class DammyData {
        
    static func createProducts() -> [ContentModel] {

        let p1 = ContentModel(imageUrl: "Bryant", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p2 = ContentModel(imageUrl: "Celtic", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p3 = ContentModel(imageUrl: "James", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p4 = ContentModel(imageUrl: "Hill", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p5 = ContentModel(imageUrl: "Lakers", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        
        let p6 = ContentModel(imageUrl: "Curry", name: "コービー・ブライアント", desc: "ペンシルベニア州フィラデルフィア出身のアメリカ合衆国のバスケットボール選手で、NBAを代表するスーパースター", detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")

        let products = [p1, p2, p3, p4, p5, p6]
        return products
    }
}

