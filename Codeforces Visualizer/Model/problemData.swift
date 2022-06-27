//
//  problemData.swift
//  Codeforces Visualizer
//
//  Created by Harshil Modi on 27/06/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let problemData = try? newJSONDecoder().decode(ProblemData.self, from: jsonData)
import Foundation

// MARK: - ProblemData
struct problemData: Codable {
    let status: String
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, contestID, creationTimeSeconds, relativeTimeSeconds: Int
    let problem: Problem
    let author: Author
    let programmingLanguage, verdict, testset: String
    let passedTestCount, timeConsumedMillis, memoryConsumedBytes: Int
}

// MARK: - Author
struct Author: Codable {
    let contestID: Int
    let members: [Member]
    let participantType: String
    let ghost: Bool
    let startTimeSeconds: Int
}

// MARK: - Member
struct Member: Codable {
    let handle: String
}

// MARK: - Problem
struct Problem: Codable {
    let contestID: Int
    let index, name, type: String
    let points, rating: Int
    let tags: [String]
}
