//
//  OrderCoordinator.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.06.25.

import Foundation
import UIKit

class OrderCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = OrderController()
        navigationController.show(controller, sender: nil)
    }
}
