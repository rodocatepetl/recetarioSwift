//
//  Pal.swift
//  RecetarioSwift
//
//  Created by Rodolfo Castillo on 01/02/24.
//

import Foundation

// Define a struct for a Pal
struct Pal: Codable {
    let number: Int
    let name: String
    let imageURL: String
    let detailURL: String
    let types: [String]
    let jobs: [Job]

    enum CodingKeys: String, CodingKey {
        case number, name
        case imageURL = "image"
        case detailURL = "detailUrl"
        case types, jobs
    }
}

// Define a struct for Job
struct Job: Codable {
    let name: String
    let level: Int
}

// Define a struct to decode the JSON file
struct PalsData: Codable {
    let pals: [Pal]
}
