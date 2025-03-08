//
//  HomeViewModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25

import Foundation

enum CellType {
    case sales
    case categories
    
}

class HomeViewModel {
    let cellTypes: [CellType] = [
        .sales,
        .categories
    ]
}
