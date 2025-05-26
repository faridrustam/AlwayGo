//
//  ProductCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 18.03.25.
//

import UIKit
import Foundation

class ProductCoordinator: Coordinator {
    var navigationController: UINavigationController
    let id: String
    let price: Int
    
    init(navigationController: UINavigationController, id: String, price: Int) {
        self.navigationController = navigationController
        self.id = id
        self.price = price
    }
    
    func start() {
        let controller = ProductController(viewModel: .init(productManager: ProductManager(),
                                                            id: id,
                                                            price: price))
        controller.hidesBottomBarWhenPushed = true
        navigationController.show(controller, sender: nil)
    }
}
