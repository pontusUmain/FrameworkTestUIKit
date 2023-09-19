//
//  ViewController.swift
//  HelloHello
//
//  Created by Pontus Croneld on 2023-09-14.
//

import UIKit
import Framework

class ViewController: UIViewController, NavigateProtocol {
    
    func presentLoginFromRoot() {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true)
    }
    
    func pushSecondViewFromRoot() {
        tabBarController?.selectedIndex = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addViews()
    }
    
    private func addViews() {
        let childViewController = MopProgrammaticVC(navigationProtocol: self)
        self.add(childViewController: childViewController, to: self.view)
    }
}

extension UIViewController {
    func add(childViewController viewController: UIViewController, to contentView: UIView) {
        let matchParentConstraints = [
            viewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(viewController.view)
        NSLayoutConstraint.activate(matchParentConstraints)
        viewController.didMove(toParent: self)
    }
}
