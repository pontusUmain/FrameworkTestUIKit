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
    private let presentButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let pushButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let loginButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let loginButton2 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    
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
        layoutPresentButton()
        layoutPushButton()
        layoutLoginButton()
        layoutLoginButton2()
        layoutTitleLabel()
    }
    
    private func layoutPresentButton() {
        presentButton.setTitle("Present nested view controller", for: .normal)
        presentButton.backgroundColor = .gray
        presentButton.addTarget(self, action: #selector(pressedPresentButton), for: .touchUpInside)
        
        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
    }
    
    private func layoutPushButton() {
        pushButton.setTitle("Push nested view controller", for: .normal)
        pushButton.backgroundColor = .gray
        pushButton.addTarget(self, action: #selector(pressedPushButton), for: .touchUpInside)
        
        view.addSubview(pushButton)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pushButton.centerYAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20).isActive = true
    }
    
    private func layoutLoginButton() {
        loginButton.setTitle("Present login on this view", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(pressedLoginButton), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20).isActive = true
    }
    
    private func layoutLoginButton2() {
        loginButton2.setTitle("Present login from root", for: .normal)
        loginButton2.backgroundColor = .blue
        loginButton2.addTarget(self, action: #selector(pressedLoginButton2), for: .touchUpInside)
        
        view.addSubview(loginButton2)
        loginButton2.translatesAutoresizingMaskIntoConstraints = false
        loginButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton2.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
    }
    
    private func layoutTitleLabel() {
        titleLabel.text = "I'm a cool VC without a storyboard"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    @objc func pressedPresentButton() {
        nextViewController = NextViewController(navigationProtocol: navigationProtocol)
        if let vc = nextViewController {
            self.present(vc, animated: true)
        }
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
    
    @objc func pressedLoginButton2() {
        navigationController?.popToRootViewController(animated: true)
        navigationProtocol.presentLoginFromRoot()
    }
}
