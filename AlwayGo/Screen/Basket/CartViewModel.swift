//
//  CartViewModel.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import Foundation

final class CartViewModel {
    private(set) var items: CartGetModel?
    private let cartManager: CartManagerUseCase
    private let orderManager: OrderManagerUseCase
    private var cartModel: CartPostModel?
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    init(cartManager: CartManagerUseCase, orderManager: OrderManagerUseCase) {
        self.cartManager = cartManager
        self.orderManager = orderManager
    }
    
    func getCartItems() {
        state = .loading
        cartManager.getProductData { [weak self] data, error in
            guard let self else { return }
            if let error {
                state = .error(message: error)
            } else if let data {
                items = data
                state = .loaded
                state = .success
            }
        }
    }
    
    func sendCartData(params: [String: [String: Any]]) {
        cartManager.sendProductData(params: params) { [weak self] data, error in
            guard let self else { return }
            if let data {
                cartModel = data
                getCartItems()
            } else if let error {
                state = .error(message: error)
            }
        }
    }
    
    func sendOrderData(params: [String: [String: Any]]) {
        orderManager.createOrder(params: params) { data, error in
            if let error {
                self.state = .error(message: error)
            } else if let data {
                print(data)
                self.items = nil
                self.state = .success
            }
        }
    }
    
    func resetProducts() {
        items = nil
    }
}
