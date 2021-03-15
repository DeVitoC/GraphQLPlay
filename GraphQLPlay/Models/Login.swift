//
//  Login.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct Login: Codable {
    let data: LoginData
}

enum LoginKeys: CodingKey {
    case data
}

struct LoginData: Codable {
    let login: String
}

enum LoginDataKeys: CodingKey {
    case login
}
