//
//  ProductCellModel.swift
//  AlwayGo
//
//  Created by Mac on 22.03.25.
//

import Foundation

struct ProductCellModel {
    let cellName: ProductCells
    let cellInfo: [String]?
    var isOpened: Bool = false
    
    static let cellTypes: [ProductCellModel] = [
        .init(cellName: .color,
              cellInfo: [""],
              isOpened: false),
        .init(cellName: .size,
              cellInfo: [""],
              isOpened: false),
        .init(cellName: .info,
              cellInfo: [""],
              isOpened: false)
    ]
}
