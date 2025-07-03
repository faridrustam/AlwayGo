//
//  FavoritesViewModel.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import Foundation

enum FavoritesSection {
    case allItems
    case boards
}

class FavoritesViewModel {
    var product = [Product]()
     
    func addProductData() {
        FileManagerHelper.shared.readDataFromFile { [weak self] product in
            guard let self else { return }
            self.product = product
        }
    }
    
    func refreshData() {
        product.removeAll()
        addProductData()
    }
}
