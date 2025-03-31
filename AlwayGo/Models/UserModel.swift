//
//  UserModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct User: Codable {
    let id, name, surname, phone: String?
    let username, email: String?
    let enabled: Bool?
    let role: String?
}
