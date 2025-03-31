//
//  ProductModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct Product: Codable {
    let productId: Int?
    let productName, description: String?
    let quantity, price, discount, specialPrice, category: Int?
}

struct ProductById: Codable {
    let userId: String?
    let productId: Int?
}
