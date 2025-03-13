//
//  HomeViewModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 08.03.25

import Foundation

enum CellType {
    case header
    case sales
    case categories
    case forYou
    case appExclusive
    case recentlyViewed
    case topStores
    case trendingNow
    case bestDealsDiscounts
    case typeLabel
    case newSeason
    case arriveIn
    case home
    case kids
    case denimFits
}

class HomeViewModel {
    let cellTypes: [CellType] = [
        .header,
        .sales,
        .categories,
        .forYou,
        .appExclusive,
        .recentlyViewed,
        .topStores,
        .trendingNow,
        .bestDealsDiscounts,
        .typeLabel,
        .newSeason,
        .arriveIn,
        .home,
        .kids,
        .denimFits
    ]
}
