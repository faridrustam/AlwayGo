// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let order = try? JSONDecoder().decode(Order.self, from: jsonData)

import Foundation

// MARK: - OrderElement
struct OrderElement: Codable {
    let id, userID: String?
    let list: [OrderList]?
    let totalPrice, totalDiscount: Int?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case list, totalPrice, totalDiscount, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - List
struct OrderList: Codable {
    let product: OrderProduct?
    let variant: ListVariant?
    let price, count: Int?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case product, variant, price, count
        case id = "_id"
    }
}

// MARK: - Product
struct OrderProduct: Codable {
    let id, title, slug: String?
    let categories: [String]?
    let description: String?
    let details, tags: [String]?
    let specs: [OrderSpec]?
    let variants: [VariantElement]?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, slug, categories, description, details, tags, specs, variants, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Spec
struct OrderSpec: Codable {
    let key, name: String?
    let values: [OrderValue]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case key, name, values
        case id = "_id"
    }
}

// MARK: - Value
struct OrderValue: Codable {
    let key: String?
    let value: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case key, value
        case id = "_id"
    }
}

// MARK: - VariantElement
struct VariantElement: Codable {
    let specs: OrderSpecs?
    let price, discount: Int?
    let discountType: DiscountType?
    let stock: Int?
    let slug: String?
    let images: [String]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case specs, price, discount, discountType, stock, slug, images
        case id = "_id"
    }
}

// MARK: - Specs
struct OrderSpecs: Codable {
    let size: String?
    let color: String?
}

// MARK: - ListVariant
struct ListVariant: Codable {
    let specs: OrderSpecs?
    let price, discount: Int?
    let discountType: String?
    let stock: Int?
    let slug: String?
    let images: [OrderImage]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case specs, price, discount, discountType, stock, slug, images
        case id = "_id"
    }
}

// MARK: - Image
struct OrderImage: Codable {
    let id: String?
    let url: String?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case url, createdAt, updatedAt
        case v = "__v"
    }
}

typealias Order = [OrderElement]
