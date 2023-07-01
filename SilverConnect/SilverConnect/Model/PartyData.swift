//
//  PartyData.swift
//  SilverConnect
//
//  Created by 최준영 on 2023/07/01.
//

import Foundation

enum PartyCategorty: String {
    case dine = "밥/카페"
    case learn = "배움"
    case exercise = "운동"
}

enum PartyState {
    case active, inactive
}

struct PartyData {
    var title: String
    var category: PartyCategorty
    var age: Int
    var state: PartyState
    var location: String
}
