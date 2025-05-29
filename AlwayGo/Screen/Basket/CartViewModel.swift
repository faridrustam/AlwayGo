//
//  CartViewModel.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import Foundation

final class CartViewModel {
    var sendState: ((ViewState) -> Void)?
    
    var state: ViewState = .idle {
        didSet {
            sendState?(state)
        }
    }
}
