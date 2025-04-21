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
        tabBar.backgroundColor = .white
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .darkGray
        tabBar.standardAppearance = tabBarAppearance
       
        let firstVC = UINavigationController(rootViewController: HomeController())
        let secondVC = UINavigationController(rootViewController: CategoriesController())
        let thirdVC = UINavigationController(rootViewController: CartController())
        let fourthVC = UINavigationController(rootViewController: FavoritesController())
        let fifthVC = UINavigationController(rootViewController: ProfileController())
            
        firstVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "homeIcon"), tag: 1)
        firstVC.tabBarItem.selectedImage = UIImage(named: "SelectedHome")
        
        secondVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "categoriesIcon"), tag: 2)
        secondVC.tabBarItem.selectedImage = UIImage(named: "SelectedCategories")
        
        thirdVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "basketIcon"), tag: 3)
        thirdVC.tabBarItem.selectedImage = UIImage(named: "SelectedBasket")
        
        fourthVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "favoritesIcon"), tag: 4)
        fourthVC.tabBarItem.selectedImage = UIImage(named: "SelectedFavorites")
        
        fifthVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profileIcon"), tag: 5)
        fifthVC.tabBarItem.selectedImage = UIImage(named: "SelectedProfile")
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    }
}
