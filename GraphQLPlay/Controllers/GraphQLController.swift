//
//  GraphQLController.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

class GraphQLController {

    func fetchLaunch(session: URLSession = URLSession.shared, completion: @escaping (Result<Launch, NetworkError>) -> Void) {
        
    }
}

enum NetworkError: Error {
    case success
    case failure
}
