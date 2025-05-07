//
//  CategoryDetailCoordinator.swift
//  AlwayGo
//
//  Created by Mac on 01.04.25.
//

import UIKit
import Foundation

class CategoryFlowCoordinator: Coordinator {
    var navigationController: UINavigationController
    let title: String?
    var categoryModel = [CategoryModel]()
    
    init(navigationController: UINavigationController, title: String?) {
        self.navigationController = navigationController
        self.title = title
    }
    
    func start() {
        let controller = CategoryDetailController(viewModel: .init(categoryModel: categoryModel,
                                                                   allCategories: categoryModel))
        controller.title = "\(title ?? "") / Categories"
        navigationController.show(controller, sender: nil)
    }
    
    func showProduct() {
        let controller = CategoryProductController()
        controller.title = title
        navigationController.show(controller, sender: nil)
    }
    
    func showFilter() {
        let controller = FilterController()
        controller.hidesBottomBarWhenPushed = true
        navigationController.show(controller, sender: nil)
    }
}
