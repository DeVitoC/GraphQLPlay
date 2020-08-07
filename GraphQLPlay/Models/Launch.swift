//
//  Launch.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct LaunchResult: Codable {
    let data: [String : Launch]
}

enum LaunchResultKeys: CodingKey {
    case data
}

struct Launch: Codable {
    let id: String
    let site: String
    let mission: Mission
    let rocket: Rocket
    let isBooked: Bool
}

enum LaunchKeys: CodingKey {
    case id
    case site
    case mission
    case rocket
    case isBooked
}

struct Mission: Codable {
    let name: String
    let missionPatch: PatchSize.RawValue
}

enum MissionKeys: CodingKey {
    case name
    case missionPatch
}

struct Rocket: Codable {
    let id: String
    let name: String
    let type: String
}

enum RocketKeys: CodingKey {
    case id
    case name
    case type
}

enum PatchSize: String {
    case large = "LARGE"
    case small = "SMALL"
}

