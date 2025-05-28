//
//  CartModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct CartPostModel: Codable {
    let id: String
    let list: [List]
    let totalPrice, totalDiscount: Int
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case list, totalPrice, totalDiscount, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - List
struct List: Codable {
    let productID, variantID: String
    let price, discount, count: Int
    let id: String

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case variantID = "variantId"
        case price, discount, count
        case id = "_id"
    }
}

struct CartModel: Codable {
    let list: CartList
}

// MARK: - List
struct CartList: Codable {
    let productID, variantID: String
    let count: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case variantID = "variantId"
        case count
    }
}
