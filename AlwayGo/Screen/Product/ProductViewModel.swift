//
//  ProductViewModel.swift
//  AlwayGo
//
//  Created by Mac on 17.03.25.
//

import Foundation

enum ProductCells {
    case color
    case size
    case info
    case expandable(type: Expandable)
}

enum Expandable {
    case features
    case reviews
    case overviewAndVideos
    case photos
}

class ProductViewModel {
    var model: [ProductCellModel] = [.init(cellName: .color,
                                           cellInfo: [""],
                                           isOpened: false),
                                     .init(cellName: .size,
                                           cellInfo: [""],
                                           isOpened: false),
                                     .init(cellName: .info,
                                           cellInfo: [""],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .features),
                                           cellInfo: ["Features",
                                                      "Welcome to features",
                                                      "Welcome to features"],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .reviews),
                                           cellInfo: ["Reviews",
                                                      "Welcome to reviews",
                                                      "Welcome to reviews"],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .overviewAndVideos),
                                           cellInfo: ["Overview and videos",
                                                      "Welcome to overview and videos",
                                                      "Welcome to overview and videos"],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .photos),
                                           cellInfo: ["Photos",
                                                      "Welcome to photos",
                                                      "Welcome to photos"],
                                           isOpened: false)]
    let cells: [ProductCells] = [
        .color,
        .size,
        .info,
        .expandable(type: .features),
        .expandable(type: .reviews),
        .expandable(type: .overviewAndVideos),
        .expandable(type: .photos)
    ]
}
