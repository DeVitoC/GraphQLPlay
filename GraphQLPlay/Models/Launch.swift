//
//  Launch.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct Launch: Codable {
    let id: Int
    let site: String
    let mission: Mission
    let rocket: Rocket
    let isBooked: Bool
}

struct Mission: Codable {
    let name: String
    let missionPatch: PatchSize.RawValue
}

struct Rocket: Codable {
    let id: Int
    let name: String
    let type: String
}

enum PatchSize: String {
    case large = "LARGE"
    case small = "SMALL"
}
