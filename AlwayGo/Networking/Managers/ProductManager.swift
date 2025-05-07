//
//  ProductManager.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.04.25.
//

import Foundation

enum ProductEndpoint: String {
    case product = "/product"
}

final class ProductManager: ProductManagerUseCase {
    
    let manager = NetworkManager()
    
    func getProductData(endpoint: ProductEndpoint, completion: @escaping ((TotalProduct?, String?) -> Void)) {
        let path = NetworkHelper.shared.configureURL(with: endpoint.rawValue)
        manager.sendRequest(url: path, model: TotalProduct.self, completion: completion)
    }
}
