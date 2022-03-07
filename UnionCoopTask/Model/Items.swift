//
//  Items.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 13/01/2022.
//

import Foundation

struct Items: Codable{
    var title : String
    var tags: [String]
    var is_answered: Bool
    var view_count: Int
    var answer_count: Int
    var score: Int
    var link: String
    var owner: Owner
}

struct Owner: Codable{
    var user_id : Int
    var profile_image: String
    var link: String
    var display_name: String
}
