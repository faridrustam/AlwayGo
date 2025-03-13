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
    var window: UIWindow?
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let controller = LogInController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
