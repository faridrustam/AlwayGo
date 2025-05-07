//
//  CategoriesManager.swift
//  AlwayGo
//
//  Created by Mac on 25.04.25.
//

import Foundation

protocol CategoriesManagerUseCase {
    func getCategories(completion: @escaping (([CategoryModel]?, String?) -> Void))
}

class CategoriesManager: CategoriesManagerUseCase {
    func getCategories(completion: @escaping (([CategoryModel]?, String?) -> Void)) {
        let url = NetworkHelper.shared.configureURL(with: "/category/nested")
        NetworkManager.shared.sendRequest(url: url, model: [CategoryModel].self, completion: completion)
    }
}
    
