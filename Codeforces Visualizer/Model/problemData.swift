// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let problemData = try? newJSONDecoder().decode(ProblemData.self, from: jsonData)

import Foundation

// MARK: - ProblemData
struct problemData: Codable {
    let status: String?
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, contestID, creationTimeSeconds, relativeTimeSeconds: Int?
    let problem: Problem
    let author: Author
    let programmingLanguage: String?
    let verdict: String?
    let testset: String?
    let passedTestCount, timeConsumedMillis, memoryConsumedBytes: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case contestID = "contestId"
        case creationTimeSeconds, relativeTimeSeconds, problem, author, programmingLanguage, verdict, testset, passedTestCount, timeConsumedMillis, memoryConsumedBytes
    }
}

// MARK: - Author
struct Author: Codable {
    let contestID: Int?
    let members: [Member?]
    let participantType: String?
    let ghost: Bool?
    let startTimeSeconds: Int?
    let room, teamID: Int?
    let teamName: String?

    enum CodingKeys: String, CodingKey {
        case contestID = "contestId"
        case members, participantType, ghost, startTimeSeconds, room
        case teamID = "teamId"
        case teamName
    }
}

// MARK: - Member
struct Member: Codable {
    let handle: String?
}

//enum Handle: String, Codable {
//    case apoorvMe = "apoorv_me"
//    case rushitote = "rushitote"
//    case stillMe = "still_me"
//}

//enum ParticipantType: String, Codable {
//    case contestant = "CONTESTANT"
//    case outOfCompetition = "OUT_OF_COMPETITION"
//    case practice = "PRACTICE"
//    case virtual = "VIRTUAL"
//}

//enum TeamName: String, Codable {
//    case icpc = "ICPC___"
//    case velle = "Velle"
//}

// MARK: - Problem
struct Problem: Codable {
    let contestID: Int?
    let index: String?
    let name: String?
    let type: String?
    let points: Int?
    let tags: [String?]
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case contestID = "contestId"
        case index, name, type, points, tags, rating
    }
}

//enum Index: String, Codable {
//    case a = "A"
//    case b = "B"
//    case b1 = "B1"
//    case b2 = "B2"
//    case c = "C"
//    case c1 = "C1"
//    case c2 = "C2"
//    case d = "D"
//    case d1 = "D1"
//    case d2 = "D2"
//    case e = "E"
//    case e1 = "E1"
//    case e2 = "E2"
//    case f = "F"
//    case f1 = "F1"
//    case f2 = "F2"
//    case g = "G"
//    case h = "H"
//    case h1 = "H1"
//    case h2 = "H2"
//    case j = "J"
//    case l = "L"
//}

//enum Tag: String, Codable {
//    case binarySearch = "binary search"
//    case bitmasks = "bitmasks"
//    case bruteForce = "brute force"
//    case chineseRemainderTheorem = "chinese remainder theorem"
//    case combinatorics = "combinatorics"
//    case constructiveAlgorithms = "constructive algorithms"
//    case dataStructures = "data structures"
//    case dfsAndSimilar = "dfs and similar"
//    case divideAndConquer = "divide and conquer"
//    case dp = "dp"
//    case dsu = "dsu"
//    case flows = "flows"
//    case games = "games"
//    case geometry = "geometry"
//    case graphMatchings = "graph matchings"
//    case graphs = "graphs"
//    case greedy = "greedy"
//    case hashing = "hashing"
//    case implementation = "implementation"
//    case interactive = "interactive"
//    case math = "math"
//    case matrices = "matrices"
//    case meetInTheMiddle = "meet-in-the-middle"
//    case numberTheory = "number theory"
//    case probabilities = "probabilities"
//    case schedules = "schedules"
//    case shortestPaths = "shortest paths"
//    case sortings = "sortings"
//    case special = "*special"
//    case stringSuffixStructures = "string suffix structures"
//    case strings = "strings"
//    case ternarySearch = "ternary search"
//    case the2Sat = "2-sat"
//    case trees = "trees"
//    case twoPointers = "two pointers"
//}

//enum TypeEnum: String, Codable {
//    case programming = "PROGRAMMING"
//}

//enum ProgrammingLanguage: String, Codable {
//    case gnuC11 = "GNU C11"
//    case gnuC14 = "GNU C++14"
//    case gnuC17 = "GNU C++17"
//    case gnuC1764 = "GNU C++17 (64)"
//    case gnuC2064 = "GNU C++20 (64)"
//    case kotlin14 = "Kotlin 1.4"
//    case msC2017 = "MS C++ 2017"
//}

//enum Testset: String, Codable {
//    case challenges = "CHALLENGES"
//    case pretests = "PRETESTS"
//    case tests = "TESTS"
//}

//enum Status: String, Codable {
//    case challenged = "CHALLENGED"
//    case compilationError = "COMPILATION_ERROR"
//    case idlenessLimitExceeded = "IDLENESS_LIMIT_EXCEEDED"
//    case memoryLimitExceeded = "MEMORY_LIMIT_EXCEEDED"
//    case ok = "OK"
//    case runtimeError = "RUNTIME_ERROR"
//    case skipped = "SKIPPED"
//    case timeLimitExceeded = "TIME_LIMIT_EXCEEDED"
//    case wrongAnswer = "WRONG_ANSWER"
//}
