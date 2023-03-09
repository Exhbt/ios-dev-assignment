//
//  ViewController.swift
//  Exhbt
//
//  Created by Rakhmatov Bekzod on 09/03/23.
//

import UIKit

class ViewController: UIViewController {

    let helloButton = MainButton(title: "See Exhbt Progress")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(helloButton)
        helloButton.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            helloButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
            helloButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            helloButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            helloButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
