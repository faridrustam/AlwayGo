//
//  ProductModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

// MARK: - TotalProduct
struct TotalProduct: Codable {
    let total, limit, page: Int?
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable, Hashable, Equatable {
    let id, title, slug: String?
    let categories: [Category]?
    let description: String?
    let details: [Detail]?
    let tags: [Category]?
    let specs: [Spec]?
    let variants: [Variant]?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, slug, categories, description, details, tags, specs, variants, createdAt, updatedAt
        case v = "__v"
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id ?? "")
    }
}

// MARK: - Category
struct Category: Codable {
    let id, name, slug, parentId: String?
    let order: Int?
    let createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
        case order, createdAt, updatedAt, parentId
        case v = "__v"
    }
}

// MARK: - Spec
struct Spec: Codable {
    let key: Key?
    let name: Name?
    let values: [Value]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case key, name, values
        case id = "_id"
    }
}

enum Key: String, Codable {
    case color = "color"
    case size = "size"
}

enum Name: String, Codable {
    case color = "Color"
    case size = "Size"
}

// MARK: - Value
struct Value: Codable {
    let key: String?
    let value: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case key, value
        case id = "_id"
    }
}

// MARK: - Variant
struct Variant: Codable {
    let specs: Specs?
    let price, discount: Int?
    let discountType: DiscountType?
    let stock: Int?
    let slug: String?
    let images: [Image]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case specs, price, discount, discountType, stock, slug, images
        case id = "_id"
    }
}

enum DiscountType: String, Codable {
    case percentage = "percentage"
    case value = "value"
}

// MARK: - Image
struct Image: Codable {
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

// MARK: - Specs
struct Specs: Codable {
    let size, color: String?
}

struct Detail: Codable {
    let anyField: String? // just guessing, you'll refine this later
}

