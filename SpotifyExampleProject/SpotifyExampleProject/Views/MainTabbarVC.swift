//
//  MainTabbarVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit

class MainTabbarVC: UITabBarController , UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }

    func setupTabbar() {
        let homeVC = HomeVC()
        let yourLibraryVC = YourLibraryVC()
        let searchVC = SearchVC()
        
        
        let tabHomeItem = UITabBarItem(title: "Home", image: UIImage(named: "homeIcon"),selectedImage: UIImage(named: "homeIcon"))
        let tabSearchItem = UITabBarItem(title: "Search", image: UIImage(named: "searchIcon"),selectedImage: UIImage(named: "searchIcon"))
        let tabYourLibraryItem = UITabBarItem(title: "Your Library", image: UIImage(named: "libraryIcon"),selectedImage: UIImage(named: "libraryIcon"))
        
        homeVC.tabBarItem = tabHomeItem
        searchVC.tabBarItem = tabSearchItem
        yourLibraryVC.tabBarItem = tabYourLibraryItem
        
        self.tabBar.tintColor = .white
        self.viewControllers = [homeVC , searchVC, yourLibraryVC]
    }
    
}
