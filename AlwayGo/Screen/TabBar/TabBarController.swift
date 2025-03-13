//  TabBarController.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import UIKit

class TabBarController: UITabBarController {
    var upperlineView: UIView?
    
    let spacing: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewControllers()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self else { return }
            addUpperLine(index: 0, isFirstTime: true)
        }
    }
    
    private func setUpViewControllers() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        self.delegate = self
        
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
    
    private func addUpperLine(index: Int, isFirstTime: Bool = false) {
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime {
            upperlineView?.removeFromSuperview()
        }
        upperlineView = UIView(frame: CGRect(x: CGFloat(Int(tabView.frame.minX + spacing)),
                                             y: tabView.frame.minY + 0.1,
                                             width: tabView.frame.size.width - spacing * 2,
                                             height: 3))
        upperlineView?.backgroundColor = UIColor.black
        tabBar.addSubview(upperlineView ?? UIView())
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addUpperLine(index: selectedIndex)
    }
}
