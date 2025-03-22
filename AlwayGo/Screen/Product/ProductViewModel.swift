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
    case features
    case reviews
    case overviewAndVideos
    case photos
}

class ProductViewModel {
    var model: [ProductCellModel] = [.init(cellInfo: "Features"),
                                     .init(cellInfo: "Reviews"),
                                     .init(cellInfo: "Overview and Videos"),
                                     .init(cellInfo: "Photo")]
    let cells: [ProductCells] = [
        .color,
        .size,
        .info,
        .features,
        .reviews,
        .overviewAndVideos,
        .photos
    ]
}
