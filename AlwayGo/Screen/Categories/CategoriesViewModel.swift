//
//  CategoriesViewModel.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import Foundation

enum ViewState {
    case success
    case loading
    case loaded
    case error(message: String)
    case idle
}

class CategoriesViewModel {
    let cellImages = ["ShirtsPhoto",
                      "SuitsPhoto",
                      "SportCoatsPhoto",
                      "PantsPhoto",
                      "SweatersPhoto",
                      "OuterwearPhoto",
                      "SocksAndUnderwearPhoto",
                      "AccessoriesPhoto"]
    let manager = CategoriesManager()
    var categoryModel = [CategoryModel]()
    var allCategories = [CategoryModel]()
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    func getCategoriesData() {
        state = .loading
        manager.getCategories { [weak self] data, error in
            guard let self else { return }
            if let data {
                categoryModel = data
                allCategories = data
                print(categoryModel)
                state = .loaded
                state = .success
            } else if let error {
                state = .error(message: error)
                state = .loaded
            }
        }
    }
    
    func resetCategories() {
        allCategories.removeAll()
        categoryModel.removeAll()
        getCategoriesData()
        state = .success
    }
}
