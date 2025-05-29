//
//  CartModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct Cart: Codable {
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
