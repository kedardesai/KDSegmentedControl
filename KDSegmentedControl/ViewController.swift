//
//  ViewController.swift
//  KDSegmentedControl
//
//  Created by Kedar Desai on 06/06/20.
//  Copyright © 2020 Nine Dots Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - UIViewLifeCycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let segmentedControl: KDSegmentedControl = KDSegmentedControl(frame: CGRect(x: 20.0, y: 100.0, width: view.bounds.width - 40.0, height: 50.0))
        segmentedControl.items = ["AM", "PM"]
        segmentedControl.thumbColor = .green
        segmentedControl.backgroundColor = .gray
        segmentedControl.dropShadow = true
        segmentedControl.selectedIndex = -1
        view.addSubview(segmentedControl)
    }


}

