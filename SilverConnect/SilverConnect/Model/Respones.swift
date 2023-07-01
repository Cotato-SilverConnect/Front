//
//  Respones.swift
//  SilverConnect
//
//  Created by 최준영 on 2023/07/01.
//

import Foundation

struct ResponseData: Codable {
    let result: String
    let httpStatus: String
    let message: String?
    let data: UserData
}

struct UserData: Codable {
    let age: Int
    let username: String
    let likeCount: Int
    let mvpCount: Int
    let participationCount: Int
    let posts: [Post]
    let participatedPosts: [Post]
}

struct Post: Codable {
    let title: String
    let dongName: String
    let createdAt: String
}
