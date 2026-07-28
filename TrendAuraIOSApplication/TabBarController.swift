//  TabBarController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.


import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        customizeAppearance()
    }
    
    private func setupTabs() {

        let sb = UIStoryboard(name: "Main", bundle: nil)

        let search = UINavigationController(
            rootViewController: sb.instantiateViewController(
                withIdentifier: "SearchViewController")
        )

        let explore = UINavigationController(
            rootViewController: sb.instantiateViewController(
                withIdentifier: "ExploreViewController")
        )

        let add = UINavigationController(
            rootViewController: sb.instantiateViewController(
                withIdentifier: "ExploreViewController")
        )

        let inbox = UINavigationController(
            rootViewController: sb.instantiateViewController(
                withIdentifier: "ExploreViewController")
        )

        let profile = UINavigationController(
            rootViewController: sb.instantiateViewController(
                withIdentifier: "SearchViewController")
        )

        search.setNavigationBarHidden(true, animated: false)
        explore.setNavigationBarHidden(true, animated: false)
        add.setNavigationBarHidden(true, animated: false)
        inbox.setNavigationBarHidden(true, animated: false)
        profile.setNavigationBarHidden(true, animated: false)

        search.tabBarItem = UITabBarItem(
            title: "search",
            image: UIImage(named: "store"),
            selectedImage: UIImage(named: "store")
        )

        explore.tabBarItem = UITabBarItem(
            title: "Explore",
            image: UIImage(named: "exploreImage!"),
            selectedImage: UIImage(named: "exploreImage!")
        )

        add.tabBarItem = UITabBarItem(
            title: " ",
            image: UIImage(named: "home"),
            selectedImage: UIImage(named: "home")
        )

        inbox.tabBarItem = UITabBarItem(
            title: "Inbox",
            image: UIImage(named: "message"),
            selectedImage: UIImage(named: "message")
        )

        profile.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(named: "profile"),
            selectedImage: UIImage(named: "profile")
        )

        viewControllers = [
            search,
            explore,
            add,
            inbox,
            profile
        ]
    }
    
    private func customizeAppearance() {

        let appearance = UITabBarAppearance()
       // appearance.configureWithOpaqueBackground()

        appearance.backgroundEffect = nil
        //appearance.backgroundColor = UIColor.black.withAlphaComponent(0.3)

        tabBar.standardAppearance = appearance

        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }

        tabBar.isTranslucent = false
    }
}



