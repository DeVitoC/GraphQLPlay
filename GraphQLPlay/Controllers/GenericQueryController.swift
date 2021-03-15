//
//  QueryGraphQLController.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

enum GenericGQLQueries {
    static let launchQuery = """
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

class GenericQueryGraphQLController {
    let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!
    let session = URLSession.shared

    func fetchLaunch<T: Codable>(_ type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let query = GQLQueries.launchQuery
        let body = ["query" : query]

        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("\(error)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                NSLog("Data is nil")
                return
            }
            do {
                let launchDict = try JSONDecoder().decode([String: T].self, from: data)
                guard let launch = launchDict["data"] else {
                    throw GraphQLError.noData
                }
                completion(.success(launch))
                return
            } catch let error {
                NSLog("\(error)")
            }
        }.resume()
    }
}

enum GraphQLError: Error {
    case noData
}

