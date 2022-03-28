//
//  TabBarController.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FeedViewController(), title: NSLocalizedString("Лента", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: ProfileViewController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
}
