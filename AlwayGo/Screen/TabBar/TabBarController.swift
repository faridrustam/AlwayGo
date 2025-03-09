//  TabBarController.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewControllers()
    }
    
    private func setUpViewControllers() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        
        let firstVC = UINavigationController(rootViewController: HomeController())
        let secondVC = UINavigationController(rootViewController: CategoriesController())
        let thirdVC = UINavigationController(rootViewController: BasketController())
        let fourthVC = UINavigationController(rootViewController: FavoritesController())
        let fifthVC = UINavigationController(rootViewController: ProfileController())
            
        firstVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "homeIcon"), tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "categoriesIcon"), tag: 2)
        thirdVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "basketIcon"), tag: 3)
        fourthVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "favoritesIcon"), tag: 4)
        fifthVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profileIcon"), tag: 5)
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    }
}
