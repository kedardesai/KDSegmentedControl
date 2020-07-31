//
//  ViewController.swift
//  KDSegmentedControl
//
//  Created by Kedar Desai on 06/06/20.
//  Copyright © 2020 Nine Dots Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KDSegmentedControlDelegate {
    
    
    // MARK: - UIViewLifeCycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let segmentControl: KDSegmentedControl = KDSegmentedControl(frame: CGRect(x: 20.0, y: 100.0, width: view.bounds.width - 40.0, height: 50.0))
        segmentControl.items = ["Item 1", "Item 2", "Item 3"]
        segmentControl.dropShadow = true
        segmentControl.thumbColor = .green
        segmentControl.cornerRadius = 10.0
        segmentControl.selectedIndex = -1
        segmentControl.backgroundColor = .lightGray
        segmentControl.delegate = self
        view.addSubview(segmentControl)

    }
    
    
    // MARK: - KDSegmentedControlDelegate Methods -
    
    func didSelectItem(atIndex index: Int, item: String) {
        print("didSelectItem(atIndex index: \(index), item: \(item)")
    }


}

