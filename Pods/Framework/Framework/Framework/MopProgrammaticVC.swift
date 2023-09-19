//
//  MopProgrammaticVC.swift
//  Framework
//
//  Created by Pontus Croneld on 2023-09-15.
//

import Foundation
import UIKit

public class MopProgrammaticVC: UIViewController {
    
    private let navigationProtocol: NavigateProtocol
    
    private let titleLabel = UILabel()
    private let pushButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let pushButton2 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let loginButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    
    public var nextViewController: UIViewController?
    
    public init(navigationProtocol: NavigateProtocol) {
        self.navigationProtocol = navigationProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Never will happen")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        print("Started")
    }
    
    private func addViews() {
        layoutPushButton()
        layoutLoginButton()
        layoutPushButton2()
        layoutTitleLabel()
    }
    
    private func layoutPushButton() {
        pushButton.setTitle("Let's go to the order list", for: .normal)
        pushButton.backgroundColor = .gray
        pushButton.addTarget(self, action: #selector(pressedPushButton), for: .touchUpInside)
        
        view.addSubview(pushButton)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func layoutLoginButton() {
        loginButton.setTitle("Let's go to login", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(pressedLoginButton), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20).isActive = true
    }
    
    private func layoutPushButton2() {
        pushButton2.setTitle("Let's go to account", for: .normal)
        pushButton2.backgroundColor = .blue
        pushButton2.addTarget(self, action: #selector(pressedPushInRootButton), for: .touchUpInside)
        
        view.addSubview(pushButton2)
        pushButton2.translatesAutoresizingMaskIntoConstraints = false
        pushButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton2.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
    }
    
    private func layoutTitleLabel() {
        titleLabel.text = "I'm the demo order wall"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    @objc func pressedPushButton() {
        nextViewController = NextViewController(navigationProtocol: navigationProtocol)
        if let vc = nextViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func pressedLoginButton() {
        navigationProtocol.presentLoginFromRoot()
    }
    
    @objc func pressedPushInRootButton() {
        navigationProtocol.pushSecondViewFromRoot()
    }
}
