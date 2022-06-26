//
//  contestData.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

import Foundation


// MARK: - Welcome1
struct contestData: Codable  {
    let status: String
    let result: [contestResult]
}

// MARK: - Result
struct contestResult: Codable  {
    let contestID: Int
    let contestName: String
    let handle: String
    let rank, ratingUpdateTimeSeconds, oldRating, newRating: Int
}

