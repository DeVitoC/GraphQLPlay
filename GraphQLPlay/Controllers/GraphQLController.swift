//
//  GraphQLController.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

enum GQLQueries {
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

class GraphQLController {
    let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!

    func fetchLaunch(session: URLSession = URLSession.shared, completion: @escaping (Result<Launch, Error>) -> Void) {
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
                let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Dict: \(dict)")
                let launch = try JSONDecoder().decode(LaunchResult.self, from: data)
                let launch1 = Array(launch.data.values)[0]
//                print(launch1)
                completion(.success(launch1))
                return
            } catch let error {
                NSLog("\(error)")
            }
        }.resume()
    }
}
