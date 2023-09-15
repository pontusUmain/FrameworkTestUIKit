//
//  NextViewController.swift
//  Framework
//
//  Created by Pontus Croneld on 2023-09-15.
//

import Foundation
import UIKit

public class NextViewController: UIViewController {
    
    private let navigationProtocol: NavigateProtocol
    
    private let titleLabel = UILabel()
    private let midButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    
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
        layoutTitleLabel()
    }
    
    private func layoutButton() {
        midButton.setTitle("Dismiss and push view from root", for: .normal)
        midButton.backgroundColor = .gray
        midButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        
        view.addSubview(midButton)
        midButton.translatesAutoresizingMaskIntoConstraints = false
        midButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        midButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    private func layoutTitleLabel() {
        titleLabel.text = "This is a nested view controller"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }
    
    @objc func pressedButton() {
        self.dismiss(animated: false)
        navigationProtocol.pushSecondViewFromRoot()
    }
}
