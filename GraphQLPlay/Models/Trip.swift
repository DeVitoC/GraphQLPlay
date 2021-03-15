//
//  Trip.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct TripData: Codable {
    let data: Trip
}

enum TripDataKeys: CodingKey {
    case data
}

struct Trip: Codable {
    let success: Bool
    let message: String
    let launch: Launch
}
