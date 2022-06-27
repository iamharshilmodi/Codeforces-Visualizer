//
//  contestData.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import Foundation

// MARK: - ContestData
struct contestData: Codable {
    let status: String
    let result: [contestResult]
}

// MARK: - Result
struct contestResult: Codable {
    let contestID: Int
    let contestName: String
    let handle: String
    let rank, ratingUpdateTimeSeconds, oldRating, newRating: Int

    enum CodingKeys: String, CodingKey {
        case contestID = "contestId"
        case contestName, handle, rank, ratingUpdateTimeSeconds, oldRating, newRating
    }
}

//struct Handle: Codable {
//    let username : String
//}
