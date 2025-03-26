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
    case expandable(type: ExpandableCell)
}

enum ExpandableCell {
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
                                           cellInfo: ["Welcome to features"],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .reviews),
                                           cellInfo: ["Welcome to reviews"],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .overviewAndVideos),
                                           cellInfo: ["Welcome to overview and videos"],
                                           isOpened: false),
                                     .init(cellName: .expandable(type: .photos),
                                           cellInfo: ["Welcome to photos"],
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
