//
//  LoginViewController.swift
//  HelloHello
//
//  Created by Pontus Croneld on 2023-09-15.
//

import UIKit

class LoginViewController: UIViewController {

    private let titleLabel = UILabel()
    private let midButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        addViews()

    }
    
    private func addViews() {
        layoutTitleLabel()
        layoutButton()
    }
    
    private func layoutTitleLabel() {
        titleLabel.text = "I am a view controller, located in the legacy app"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
    private func layoutButton() {

        midButton.setTitle("Press me to login and dismiss", for: .normal)
        midButton.backgroundColor = .gray
        midButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)

        view.addSubview(midButton)
        midButton.translatesAutoresizingMaskIntoConstraints = false
        midButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        midButton.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc func pressedButton() {
        print("Did login")
        self.dismiss(animated: true)
    }
}
