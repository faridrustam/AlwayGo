//
//  OrderViewModel.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.06.25.
//

import Foundation

class OrderViewModel {
    
    private(set) var order: Order?
    let orderManager: OrderManagerUseCase
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
    
    init(orderManager: OrderManagerUseCase) {
        self.orderManager = orderManager
    }
    
    func getOrder() {
        orderManager.getOrder { [weak self] data, error in
            guard let self else { return }
            if let error {
                state = .error(message: error)
            } else if let data {
                order = data
                state = .loaded
                state = .success
            }
        }
    }
}
