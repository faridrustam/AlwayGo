//
//  OrderManager.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 20.06.25.
//

import Foundation

protocol OrderManagerUseCase {
    func createOrder(params: [String: Any], completion: @escaping ((Order?, String?) -> Void))
    func getOrder(completion: @escaping ((Order?, String?) -> Void))
}

final class OrderManager: OrderManagerUseCase {
    func createOrder(params: [String : Any], completion: @escaping ((Order?, String?) -> Void)) {
        let url = NetworkHelper.shared.configureURL(with: "/order")
        NetworkManager.shared.sendRequest(url: url, method: .post, params: params, model: Order.self, completion: completion)
    }
    
    func getOrder(completion: @escaping ((Order?, String?) -> Void)) {
        let url = NetworkHelper.shared.configureURL(with: "/order")
        NetworkManager.shared.sendRequest(url: url, model: Order.self, completion: completion)
    }
}
