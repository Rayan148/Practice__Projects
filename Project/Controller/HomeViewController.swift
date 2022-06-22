//
//  ViewController.swift
//  Project
//
//  Created by Ebpearls on 19/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension HomeViewController {
    
    private func style() {
        homeView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(homeView)
        
        NSLayoutConstraint.activate([
            homeView.heightAnchor.constraint(equalTo: view.heightAnchor),
            homeView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}

