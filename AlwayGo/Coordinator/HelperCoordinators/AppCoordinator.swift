//
//  AppCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit
import Foundation

class AppCoordinator: Coordinator {
    var window: UIWindow?
    var navigationController: UINavigationController
    
    init(window: UIWindow?, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        tabBarRoot()
    }
    
    private func tabBarRoot() {
        let controller = TabBarController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
