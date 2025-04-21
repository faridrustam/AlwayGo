//
//  LoginModel.swift
//  AlwayGo
//
//  Created by Mac on 20.04.25.
//

import Foundation

struct LoginModel: Codable {
    let token: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let id, firstName, lastName, email: String?
    let role: String?
    let balance: Int?
    let profile: LoginProfile?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName, lastName, email, role, balance, profile, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Profile
struct LoginProfile: Codable {
    let addressTitle, country, street, city: String?
    let postalCode, state, phone, id: String?

    enum CodingKeys: String, CodingKey {
        case addressTitle, country, street, city, postalCode, state, phone
        case id = "_id"
    }
}
