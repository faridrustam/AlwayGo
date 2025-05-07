//
//  CategoryModel.swift
//  AlwayGo
//
//  Created by Mac on 25.04.25.
//

import Foundation

protocol CategoryNames {
    var categoryName: String { get }
}

struct CategoryModel: Codable, CategoryNames {
    let id, name, slug: String?
    let parentID: String?
    let order: Int?
    let createdAt, updatedAt: String?
    let v: Int?
    let children: [CategoryModel]?
    
    var categoryName: String {
        name ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
        case parentID = "parentId"
        case order, createdAt, updatedAt
        case v = "__v"
        case children
    }
}

struct ChildrenCategoryModel: Codable, CategoryNames {
    let id, name, slug: String?
    let parentID: String?
    let order: Int?
    let createdAt, updatedAt: String?
    let v: Int?
    
    var categoryName: String {
        name ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, slug
        case parentID = "parentId"
        case order, createdAt, updatedAt
        case v = "__v"
    }
}
