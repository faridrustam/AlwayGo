//
//  RegisterModel.swift
//  AlwayGo
//
//  Created by Mac on 20.04.25.
//

import Foundation

struct RegisterModel: Codable {
    let firstName, lastName, email, role: String?
    let balance: Int?
    let profile: RegisterProfile?
    let id, createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, email, role, balance, profile
        case id = "_id"
        case createdAt, updatedAt
        case v = "__v"
    }
}

struct RegisterProfile: Codable {
    let addressTitle, country, street, city: String?
    let postalCode, state, phone, id: String?

    enum CodingKeys: String, CodingKey {
        case addressTitle, country, street, city, postalCode, state, phone
        case id = "_id"
    }
}
