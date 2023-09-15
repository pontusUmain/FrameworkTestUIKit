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
        self.navigationController?.popToRootViewController(animated: false)
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private let titleLabel = UILabel()
    private let storyboardButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let progButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        addViews()
    }
    
    private func addViews() {
        layoutStoryboardButton()
        layoutProgrammaticButton()
        layoutTitleLabel()
    }
    
    private func layoutStoryboardButton() {

        storyboardButton.setTitle("Press me for Storyboard", for: .normal)
        storyboardButton.backgroundColor = .gray
        storyboardButton.addTarget(self, action: #selector(pressedStoryboardButton), for: .touchUpInside)

        view.addSubview(storyboardButton)
        storyboardButton.translatesAutoresizingMaskIntoConstraints = false
        storyboardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        storyboardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func layoutProgrammaticButton() {

        progButton.setTitle("Press me for Programmatic", for: .normal)
        progButton.backgroundColor = .gray
        progButton.addTarget(self, action: #selector(pressedButton2), for: .touchUpInside)

        view.addSubview(progButton)
        progButton.translatesAutoresizingMaskIntoConstraints = false
        progButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progButton.topAnchor.constraint(equalTo: storyboardButton.bottomAnchor, constant: 20).isActive = true
    }

    
    private func layoutTitleLabel() {
        titleLabel.text = "Title"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
    
    @objc func pressedStoryboardButton() {
        print("Pressed")
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: MOPViewController.self))
        if let vc = storyboard.instantiateViewController(withIdentifier: "MainID") as? MOPViewController {
           self.present(vc, animated: true)
        }
    }
    
    @objc func pressedButton2() {
        let vc = MopProgrammaticVC(navigationProtocol: self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
