//
//  HomeUIView.swift
//  Project
//
//  Created by Ebpearls on 19/06/2022.
//

import UIKit
import PureLayout

class ProfileUIView: UIView {
    
    var setUpConstraints = true
    
    weak var headerView: UIImageView!
    weak var profileImageView: UIImageView!
    weak var segmentedButtonControls: UISegmentedControl!
    
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        let headerView = UIImageView(frame: .zero)
        headerView.backgroundColor = UIColor.systemPink
        headerView.autoSetDimension(.height, toSize: screenSize.width/2)
        
        let profileImageView = UIImageView(frame: .zero)
        profileImageView.image = UIImage(named: "image")
        profileImageView.contentMode = .scaleToFill
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .gray
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 1.0
        profileImageView.makeCorner(withRadius: 60)
        profileImageView.autoSetDimension(.width, toSize: 120.0)
        profileImageView.autoSetDimension(.height, toSize: 120.0)
        
        let segmentedButtonControls = UISegmentedControl(items: ["Tweets", "Media", "Likes"])
        
        self.headerView = headerView
        self.profileImageView = profileImageView
        self.segmentedButtonControls = segmentedButtonControls
        
        self.addSubview(headerView)
        self.addSubview(profileImageView)
        self.addSubview(segmentedButtonControls)
    }
    
    override func updateConstraints() {
        if(setUpConstraints) {
            
            let edgesInset: CGFloat = 20.0
            let centerOffset: CGFloat = 60.0
            
            headerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
            
            profileImageView.autoPinEdge(toSuperviewEdge: .left, withInset: edgesInset)
            profileImageView.autoPinEdge(.bottom, to: .bottom, of: headerView, withOffset: centerOffset)
            
            segmentedButtonControls.autoPinEdge(.bottom, to: .bottom, of: profileImageView, withOffset: centerOffset)            
            segmentedButtonControls.autoPinEdge(toSuperviewEdge: .left, withInset: edgesInset)
            segmentedButtonControls.autoPinEdge(toSuperviewEdge: .right, withInset: edgesInset)
            
            setUpConstraints = false
        }
        super.updateConstraints()
    }
}
extension UIView {
    func makeCorner(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
}
