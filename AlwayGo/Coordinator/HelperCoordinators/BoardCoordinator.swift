//
//  BoardCoordinator.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 23.03.25.
//

import UIKit
import Foundation

final class BoardCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = BoardCreationController()
        controller.hidesBottomBarWhenPushed = true
        navigationController.present(controller, animated: true)
    }
}
