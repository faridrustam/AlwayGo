//
//  LoginCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import UIKit
import Foundation

final class LogInCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ResetPasswordController()
        navigationController.show(controller, sender: nil)
    }
    
    func showSetNewPassword() {
        let controller = SetNewPasswordController()
        navigationController.show(controller, sender: nil)
    }
}
