//
//  SeeMoreCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 10.03.25.
//

import UIKit
import Foundation

class SeeMoreCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SeeMoreController()
        navigationController.show(controller, sender: nil)
    }
}
