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
}

class ProductViewModel {
    private let productManager: ProductManagerUseCase
    private(set) var productData: Product?
    private let id: String
    let price: Int
    var model = ProductCellModel.cellTypes
//    let name: String?
//    var value: Value?
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    init(productManager: ProductManagerUseCase, id: String, price: Int) {
        self.productManager = productManager
        self.id = id
        self.price = price
    }
    
    let cells: [ProductCells] = [
        .color,
        .size,
        .info,
        .expandable(type: .features),
        .expandable(type: .reviews)
    ]
    
    func getProductDetail() {
        state = .loading
        productManager.getProductDetail(id: id) { [weak self] data, error in
            guard let self else { return }
            if let data {
                productData = data
                state = .loaded
                state = .success
            } else if let error {
                state = .error(message: error)
                state = .loaded
            }
        }
    }
//    
//    func getFilteredProducts(with index: Int) {
//        state = .loading
//        productManager.getProductDetail(id: id) { [weak self] data, error in
//            guard let self else { return }
//            if let data {
//                value = data.specs?[index].values?.filter { $0.key == self.name }.first
//                state = .loaded
//                state = .success
//            } else if let error {
//                state = .error(message: error)
//                state = .loaded
//            }
//        }
//    }
}
