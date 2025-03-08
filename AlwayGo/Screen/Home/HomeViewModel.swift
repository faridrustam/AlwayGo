//
//  HomeViewModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25

import Foundation

enum CellType {
    case sales
    case categories
    case forYou
    case recentlyViewed
    case trendingNow
    case bestDealsDiscounts
}

class HomeViewModel {
    let cellTypes: [CellType] = [
        .sales,
        .categories,
        .forYou,
        .recentlyViewed,
        .trendingNow,
        .bestDealsDiscounts
    ]
}
