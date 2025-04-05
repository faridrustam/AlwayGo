//
//  CategoryProductCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 04.04.25.
//

import UIKit
import Foundation

class CategoryProductCoordinator: Coordinator {
    var navigationController: UINavigationController
    var title: String
    
    init(navigationController: UINavigationController, title: String) {
        self.navigationController = navigationController
        self.title = title
    }
    
    func start() {
        let controller = CategoryProductController()
        controller.title = title
        navigationController.show(controller, sender: nil)
    }
}
