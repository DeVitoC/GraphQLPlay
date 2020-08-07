//
//  GQLQueries.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

enum GQLQueries {
    static let launch = """
        query {
            launch(id:4) {
                id
                site
                mission {
                    name
                    missionPatch(size:SMALL)
                }
                rocket {
                    id
                    name
                    type
                }
                isBooked
            }
        }
    """
}
