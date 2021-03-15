//
//  TripGraphQLController.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

enum GQLMutationQuery {
    static let login = """
    mutation TripUpdateResponse {
        login(email: "toolofjesus@yahoo.com")
    }
    """
}

class MutateQueryGraphQLController {
    // MARK: - Properties
    let url = URL(string: "https://apollo-fullstack-tutorial.herokuapp.com/")!
    let variables: [String : String] = ["email" : "toolofjesus@yahoo.com"]

    func login(session: URLSession = URLSession.shared, completion: @escaping (Result<LoginData, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let mutation = GQLMutation.login
        let body: [String : Any] = ["query" : mutation/*, "variables" : variables*/]
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
                let loginJSON = try JSONDecoder().decode(Login.self, from: data)
                let login = loginJSON.data
                completion(.success(login))

            } catch let error {
                NSLog("\(error)")
                completion(.failure(error))
                return
            }
        }.resume()
    }
}
