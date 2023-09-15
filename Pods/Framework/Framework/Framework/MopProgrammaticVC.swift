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
    private let midButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
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
        layoutButton()
        layoutLoginButton()
        layoutLoginButton2()
        layoutTitleLabel()
    }
    
    private func layoutButton() {
        midButton.setTitle("Present nested view controller", for: .normal)
        midButton.backgroundColor = .gray
        midButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        
        view.addSubview(midButton)
        midButton.translatesAutoresizingMaskIntoConstraints = false
        midButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        midButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func layoutLoginButton() {
        loginButton.setTitle("Present login on this view", for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.addTarget(self, action: #selector(pressedLoginButton), for: .touchUpInside)
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: midButton.bottomAnchor, constant: 20).isActive = true
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
    
    @objc func pressedButton() {
        nextViewController = NextViewController(navigationProtocol: navigationProtocol)
        if let vc = nextViewController {
            self.present(vc, animated: true)
        }
    }
    
    @objc func pressedLoginButton() {
        navigationProtocol.presentLogin()
    }
    
    @objc func pressedLoginButton2() {
        navigationController?.popToRootViewController(animated: false)
        navigationProtocol.presentLogin()
    }
}
