//
//  SignUpCoordinator.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 13.03.25.
//

import Foundation
import UIKit

final class SignUpCoordinator: Coordinator {
    var navigationController: UINavigationController
    var window: UIWindow?
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let controller = SignUpController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
