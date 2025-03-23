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
    let sections: [FavoritesSection] = [.allItems, .boards]
}
