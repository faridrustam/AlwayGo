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
    case header
    case sales
    case forYou
    case appExclusive
    case recentlyViewed
    case topStores
    case trendingNow
}

class HomeViewModel {
    var product: [Product]?
    var filteredProducts: [Product] = []
    var productItems: [ProductModel] = []
    let manager = ProductManager()
    var success: (() -> Void)?
    
    let cellTypes: [CellType] = [.header, .sales, .forYou,
                                 .appExclusive, .recentlyViewed, .topStores,
                                 .trendingNow]
    
    func getCategoryData() {
        getItems(title: "Shirts") {
                self.getItems(title: "Sport Coats") {
                    self.getItems(title: "Pants") {
                        self.success?()
                    }
                }
            }
        }
    
    func getItems(title: String, completion: @escaping () -> Void) {
        manager.getProductData(endpoint: .product) { data, errorMessage in
            if let errorMessage {
                print(errorMessage)
            } else if let data {
                self.product = data.products
                let filtered = self.filterCategory(category: title)
                self.productItems.append(.init(title: title, items: filtered))
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
