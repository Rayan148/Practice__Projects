//
//  ViewController.swift
//  Project
//
//  Created by Ebpearls on 19/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
    }
    
    let centerText: UILabel = {
        let valueText = "This is Home Page"
        let labelView = UILabel()
        labelView.text = valueText
        labelView.textColor = UIColor.purple
        labelView.font = UIFont(name: "Helvetica-Bold", size: 20)
        labelView.numberOfLines = 0
        labelView.lineBreakMode = .byWordWrapping
        
        return labelView
    }()

    func addConstraints() {
        view.addSubview(centerText)
        
        centerText.translatesAutoresizingMaskIntoConstraints = false
//        centerText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
//        centerText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
//        centerText.frame = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
        centerText.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        centerText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        centerText.alignmentRect(forFrame: CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width: 200, height: 300))
    }

}

