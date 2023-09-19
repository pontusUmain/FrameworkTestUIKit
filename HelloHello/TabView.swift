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
        setupAppearance()
    }

    func setupViewControllers() {
        let firstVC = ViewController()
        firstVC.tabBarItem = UITabBarItem(title: "MOP", image: nil, tag: 0)

        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Account", image: nil, tag: 1)

        viewControllers = [firstVC, secondVC]
    }
    
    func setupAppearance() {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor.gray
        tabBar.addSubview(lineView)
    }
}
