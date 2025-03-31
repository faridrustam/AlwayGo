//
//  OrderModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation

struct OrderModel: Codable {
    let orderId: Int?
    let email, userId: String?
    let orderItems: [OrderItem]?
    let orderDate: String?
    let payment: Payment?
    let totalAmount: Int?
    let orderStatus, text: String?
}

// MARK: - OrderItem
struct OrderItem: Codable {
    let orderItemId, product: Int?
    let order: Order?
    let quantity, discount, orderedProductPrice: Int?
}

// MARK: - Order
struct Order: Codable {
    let orderId: Int?
    let userId, email, orderDate, shippingAddress: String?
    let trackingNumber: String?
    let totalAmount: Int?
    let orderStatus: String?
    }

// MARK: - Payment
struct Payment: Codable {
    let paymentId: Int?
    let paymentMethod: String?
}
