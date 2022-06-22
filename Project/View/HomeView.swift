//
//  HomeView.swift
//  Project
//
//  Created by Ebpearls on 20/06/2022.
//

import UIKit

class HomeView: UIView {
    
    let centerText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    
    func style() {
        
        backgroundColor = .systemPink
        
        let valueText = "This is Home Page"
        centerText.text = valueText
        centerText.textColor = UIColor.purple
        centerText.font = UIFont(name: "Helvetica-Bold", size: 20)
        centerText.numberOfLines = 0
        centerText.lineBreakMode = .byWordWrapping
    }
    
    func addConstraints() {
        addSubview(centerText)
        
        centerText.translatesAutoresizingMaskIntoConstraints = false
        centerText.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        centerText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
}
