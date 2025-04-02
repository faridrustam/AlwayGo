//
//  CategoryDetailCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 01.04.25.
//

import UIKit
import Foundation

class CategoryDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    let title: String
    
    init(navigationController: UINavigationController, title: String) {
        self.navigationController = navigationController
        self.title = title
    }
    
    func start() {
        let controller = CategoryDetailController()
        controller.title = "\(title) / Categories"
        navigationController.show(controller, sender: nil)
    }
}
