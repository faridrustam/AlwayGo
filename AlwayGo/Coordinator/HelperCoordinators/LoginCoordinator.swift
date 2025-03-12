//
//  LoginCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import UIKit
import Foundation

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginController()
        navigationController.show(controller, sender: nil)
    }
}
