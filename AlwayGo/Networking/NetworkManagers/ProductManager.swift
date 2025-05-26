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
    func getProductData(endpoint: ProductEndpoint, completion: @escaping ((TotalProduct?, String?) -> Void)) {
        let path = NetworkHelper.shared.configureURL(with: endpoint.rawValue)
        NetworkManager.shared.sendRequest(url: path, model: TotalProduct.self, completion: completion)
    }
    
    func getProductDetail(id: String, completion: @escaping (Product?, String?) -> Void) {
        let path = NetworkHelper.shared.configureURL(with: "/product/\(id)")
        NetworkManager.shared.sendRequest(url: path, model: Product.self, completion: completion)
    }
}
