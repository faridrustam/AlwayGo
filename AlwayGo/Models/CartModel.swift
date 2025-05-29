//
//  CartModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct CartPostModel: Codable {
    let id: String?
    let list: [List]?
    let totalPrice, totalDiscount: Int?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case list, totalPrice, totalDiscount, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - List
struct List: Codable {
    let productId, variantId: String?
    let price, discount, count: Int?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case price, discount, count, productId, variantId
        case id = "_id"
    }
}

struct CartModel: Codable {
    let list: CartList
}

// MARK: - List
struct CartList: Codable {
    let productID, variantID: String?
    let count: Int?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case variantID = "variantId"
        case count
    }
}

//MARK: - Get Cart List Model

struct CartGetModel: Codable {
    let id: String?
    let list: [GetCartList]?
    let totalPrice, totalDiscount: Int?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case list, totalPrice, totalDiscount, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - List
struct GetCartList: Codable {
    let productID: ProductId?
    let variantID: String?
    let price, discount, count: Int?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case variantID = "variantId"
        case price, discount, count
        case id = "_id"
    }
}

// MARK: - ProductId
struct ProductId: Codable {
    let id, title, slug: String?
    let categories: [String]?
    let description: String?
    let details, tags: [String]?
    let specs: [Spec]?
    let variants: [Variant]?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, slug, categories, description, details, tags, specs, variants, createdAt, updatedAt
        case v = "__v"
    }
}
