//  TabBarController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.


import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TabBarController viewDidLoad running")
        
        setupTabs()
        //customizeAppearance()
        setupTabBarAppearance()
    }
    
    private func setupTabs() {

        let sb = UIStoryboard(name: "Main", bundle: nil)

        let search = UINavigationController(
                    rootViewController: sb.instantiateViewController(
                        withIdentifier: "ExploreViewController")
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
                        withIdentifier: "ChatViewController")
                )

                let profile = UINavigationController(
                    rootViewController: sb.instantiateViewController(
                        withIdentifier: "UserProfileViewController")
                )

        search.setNavigationBarHidden(true, animated: false)
        explore.setNavigationBarHidden(true, animated: false)
        add.setNavigationBarHidden(true, animated: false)
        inbox.setNavigationBarHidden(true, animated: false)
        profile.setNavigationBarHidden(true, animated: false)

        search.tabBarItem = UITabBarItem(
                    title: "Store",
                    image: UIImage(named: "store")?.withRenderingMode(.alwaysOriginal),
                    selectedImage: UIImage(named: "store_Image")?.withRenderingMode(.alwaysOriginal)
                )

                explore.tabBarItem = UITabBarItem(
                    title: "Explore",
                    image: UIImage(named: "explore_Image")?.withRenderingMode(.alwaysOriginal),
                    selectedImage: UIImage(named: "explore")?.withRenderingMode(.alwaysOriginal)
                )

                add.tabBarItem = UITabBarItem(
                    title: "",
                    image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal),
                    selectedImage: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
                )
        inbox.tabBarItem = UITabBarItem(
                    title: "Inbox",
                    image: UIImage(named: "message")?.withRenderingMode(.alwaysOriginal),
                    selectedImage: UIImage(named: "message_Image")?.withRenderingMode(.alwaysOriginal)
                )

                profile.tabBarItem = UITabBarItem(
                    title: "Profile",
                    image: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal),
                    selectedImage: UIImage(named: "profile_Image")?.withRenderingMode(.alwaysOriginal)
                )

        viewControllers = [
            search,
            explore,
            add,
            inbox,
            profile
        ]
    }
    
    let gradientColor = UIColor.gradientColor(
        colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF")
        ],
        size: CGSize(width: 60, height: 20)
    )
    
    private func setupTabBarAppearance() {
        tabBar.isTranslucent = false

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black


        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.stackedLayoutAppearance.normal.iconColor = .white

        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: gradientColor
        ]
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance

        tabBar.backgroundColor = .black.withAlphaComponent(0.96)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white

    }
    
}



