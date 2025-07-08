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
    private let cartManager: CartManagerUseCase
    private let id: String
    private var cartModel: CartPostModel?
    private(set) var productData: Product?
    var products = Set<Product>()
    let price: Int
    var model = ProductCellModel.cellTypes
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    init(productManager: ProductManagerUseCase, cartManager: CartManagerUseCase, id: String, price: Int) {
        self.productManager = productManager
        self.cartManager = cartManager
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
                products.insert(data)
                state = .loaded
                state = .success
            } else if let error {
                state = .error(message: error)
                state = .loaded
            }
        }
    }
    
    func sendCartData(params: [String: [String: Any]]) {
        cartManager.sendProductData(params: params) { [weak self] data, error in
            guard let self else { return }
            if let data {
                cartModel = data
                state = .success
            } else if let error {
                state = .error(message: error)
            }
        }
    }
}
