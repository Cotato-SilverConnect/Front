//
//  LocalDataModel.swift
//  SilverConnect
//
//  Created by 최준영 on 2023/07/01.
//

import Foundation

struct Dong: Decodable {
    var dong_id: Int
    var latitude: Double
    var longitude: Double
    var name: String
    var gu_id: Int
}

struct Gu: Decodable {
    var gu_id: Int
    var latitude: Double
    var longitude: Double
    var name: String
}

