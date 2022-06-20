//
//  PracticeUIViewController.swift
//  Project
//
//  Created by Ebpearls on 19/06/2022.
//

import UIKit

class ProfileUIViewController: UIViewController {

    let practice = ProfileUIView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(practice)
        
        //autolayout
        practice.autoPinEdgesToSuperviewEdges(with: .zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
