//
//  CartManager.swift
//  AlwayGo
//
//  Created by Mac on 27.05.25.
//

import Foundation
import Alamofire

protocol CartManagerUseCase {
    func sendProductData(params: [String: [String: Any]], completion: @escaping ((CartPostModel?, String?) -> Void))
}

final class CartManager: CartManagerUseCase {
    
    func sendProductData(params: [String: [String: Any]], completion: @escaping ((CartPostModel?, String?) -> Void)) {
        let url = NetworkHelper.shared.configureURL(with: "/cart")
        NetworkManager.shared.sendRequest(url: url, method: .post, encoding: .json, params: params, model: CartPostModel.self, completion: completion)
    }
}
