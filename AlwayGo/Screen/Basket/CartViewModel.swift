//
//  CartViewModel.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import Foundation

final class CartViewModel {
    var items: CartGetModel?
    var cartManager: CartManagerUseCase
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    init(cartManager: CartManagerUseCase) {
        self.cartManager = cartManager
    }
    
    func getCartItems() {
        cartManager.getProductData { [weak self] data, error in
            guard let self else { return }
            if let error {
                state = .error(message: error)
            } else if let data {
                items = data
                print(items)
                state = .success
            }
        }
    }
}
