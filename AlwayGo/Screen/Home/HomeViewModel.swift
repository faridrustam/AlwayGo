//
//  HomeViewModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25

import Foundation

struct ProductModel {
    let title: String?
    let items: [Product]?
}

enum CellType {
    case sales
    case forYou
    case appExclusive
    case recentlyViewed
    case topStores
    case trendingNow
}

class HomeViewModel {
    private(set) var product: [Product]?
    private(set) var filteredProducts: [Product] = []
    private(set) var productItems: [ProductModel] = []
    private let manager = ProductManager()
    var success: (() -> Void)?
    
    let cellTypes: [CellType] = [.sales, .forYou,
                                 .appExclusive, .recentlyViewed, .topStores,
                                 .trendingNow]
    
    func getCategoryData() {
        getItems(title: "Shirts") { [weak self] in
            guard let self else { return }
            getItems(title: "Sport Coats") {
                self.getItems(title: "Pants") {
                    self.success?()
                }
            }
        }
    }
    
    func getItems(title: String, completion: @escaping () -> Void) {
        manager.getProductData(endpoint: .product) { [weak self] data, errorMessage in
            guard let self else { return }
            if let errorMessage {
                print(errorMessage)
            } else if let data {
                product = data.products
                let filtered = filterCategory(category: title)
                productItems.append(.init(title: title, items: filtered))
                completion()
            }
        }
    }
    
    func filterCategory(category: String) -> [Product]? {
        filteredProducts.removeAll()
        filteredProducts = product?.filter({ $0.categories?.first?.name == category }) ?? []
        return filteredProducts
    }
}
