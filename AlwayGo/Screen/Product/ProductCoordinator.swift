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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProductController()
        controller.hidesBottomBarWhenPushed = true
        navigationController.show(controller, sender: nil)
    }
}
