//
//  CartModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct Cart: Codable {
    let userId: String?
    let items: [Item]?
    let totalPrice: Int?
}

// MARK: - Item
struct Item: Codable {
    let id: Int?
    let productName: String?
    let quantity, price, totalPrice: Int?
}
