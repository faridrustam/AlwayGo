//
//  ItemSelectionCoordinator.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation
import UIKit

final class ItemSelectionCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ItemSelectionController()
        controller.hidesBottomBarWhenPushed = true
        let navController = UINavigationController(rootViewController: controller)
        navigationController.present(navController, animated: true)
    }
}
