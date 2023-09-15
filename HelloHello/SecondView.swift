//
//  SecondView.swift
//  HelloHello
//
//  Created by Pontus Croneld on 2023-09-15.
//

import Foundation
import UIKit

class SecondViewController: UIViewController  {

    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        addViews()

    }
    
    private func addViews() {
        layoutTitleLabel()
    }
    
    private func layoutTitleLabel() {
        titleLabel.text = "You did it!"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
