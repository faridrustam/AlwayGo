//
//  CategoryDetailViewModel.swift
//  AlwayGo
//
//  Created by Mac on 01.04.25.
//

import Foundation

class CategoryDetailViewModel {
    let cells = ["All woman", "New in", "Clothing", "Shoes", "Bag", "Accessories"]
    var categoryModel: [CategoryModel]
    private(set) var allCategories: [CategoryModel]
    
    init(categoryModel: [CategoryModel], allCategories: [CategoryModel]) {
        self.categoryModel = categoryModel
        self.allCategories = allCategories
    }
}
