//
//  userData.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 26/06/22.
//

import Foundation

// MARK: - Welcome
struct userData: Codable {
    let status: String
    let result: [userResult]
}

// MARK: - Result
struct userResult: Codable {
    let lastName, country: String
    let lastOnlineTimeSeconds: Int
    let city: String
    let rating, friendOfCount: Int
    let titlePhoto: String
    let handle: String
    let avatar: String
    let firstName: String
    let contribution: Int
    let organization, rank: String
    let maxRating, registrationTimeSeconds: Int
//    let email: String
    let maxRank: String
}
