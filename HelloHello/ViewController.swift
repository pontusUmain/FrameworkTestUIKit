//
//  ViewController.swift
//  HelloHello
//
//  Created by Pontus Croneld on 2023-09-14.
//

import UIKit
import Framework

class ViewController: UIViewController, NavigateProtocol {
    func presentLogin() {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true)
    }
    
    func presentSomeOtherView() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private let titleLabel = UILabel()
    private let midButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    private let midButton2 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        addViews()

    }
    
    private func addViews() {
        layoutButton1()
        layoutButton2()
        layoutTitleLabel()
    }
    
    private func layoutButton1() {

        midButton.setTitle("Press me for Storyboard", for: .normal)
        midButton.backgroundColor = .gray
        midButton.addTarget(self, action: #selector(pressedButton1), for: .touchUpInside)

        view.addSubview(midButton)
        midButton.translatesAutoresizingMaskIntoConstraints = false
        midButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        midButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func layoutButton2() {

        midButton2.setTitle("Press me for Programmatic", for: .normal)
        midButton2.backgroundColor = .gray
        midButton2.addTarget(self, action: #selector(pressedButton2), for: .touchUpInside)

        view.addSubview(midButton2)
        midButton2.translatesAutoresizingMaskIntoConstraints = false
        midButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        midButton2.topAnchor.constraint(equalTo: midButton.bottomAnchor, constant: 20).isActive = true
    }

    
    private func layoutTitleLabel() {
        titleLabel.text = "Title"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
    
    @objc func pressedButton1() {
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
