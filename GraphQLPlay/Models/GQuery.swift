//
//  GQuery.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct GQuery {
    let query: String
    let variables: [String : Any]?

    init(query: String, variables: [String : Any]? = nil) {
        self.query = query
        self.variables = variables
    }

    func jsonData() throws -> Data {
        var theDict: [String : Any] = ["query" : query]
        if let variables = variables {
            theDict["variables"] = variables
        }
        return try JSONSerialization.data(withJSONObject: theDict, options: [])
    }
}
