//
//  TabView.swift
//  HelloHello
//
//  Created by Pontus Croneld on 2023-09-19.
//

import Foundation
import UIKit

public class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        setupViewControllers()
    }

    func setupViewControllers() {
        let firstVC = ViewController()
        firstVC.tabBarItem = UITabBarItem(title: "MOP", image: nil, tag: 0)

        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Account", image: nil, tag: 1)

        viewControllers = [firstVC, secondVC]
    }
}
