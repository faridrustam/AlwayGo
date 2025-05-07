//
//  ProductManagerUseCase.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.04.25.
//

import Foundation

protocol ProductManagerUseCase {
    func getProductData(endpoint: ProductEndpoint, completion: @escaping ((TotalProduct?, String?) -> Void))
}
