//
//  UISegmentedControlDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit

final class UISegmentedControlDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {
    
    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    @IBOutlet internal var segmentedControlWithTwoSegments: UISegmentedControl!
    @IBOutlet internal var segmentedControlWithThreeSegments: UISegmentedControl!
    @IBOutlet internal var selectedTab1Label: UILabel!
    @IBOutlet internal var selectedTab2Label: UILabel!
    
    internal var uiSegmentedControlWithSegmentWidthsByContent: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Segmented Control"
        
        setupContainerViews()
        setupSegmentedControls()
    }
    
    private func setupContainerViews() {
        for containerView in [containerView1, containerView2] {
            containerView?.layer.cornerRadius = 8
            containerView?.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerView?.layer.shadowRadius = 14
            containerView?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
            containerView?.layer.shadowOpacity = 1
        }
    }
    
    private func setupSegmentedControls() {
        for segmentedControl in [segmentedControlWithTwoSegments, segmentedControlWithThreeSegments] {
            segmentedControl?.setTitleTextAttributes([.foregroundColor : UIColor(red: 0, green: 0, blue: 0, alpha: 1)], for: .selected)
            segmentedControl?.setTitleTextAttributes([.foregroundColor : UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)], for: .normal)
        }
    }
    
    @IBAction internal func segmentValueChangedAtFirstSegmentedControl(_ sender: Any) {
        if segmentedControlWithTwoSegments.selectedSegmentIndex == 0 {
            selectedTab1Label.text = "Tab 1"
        }else {
            selectedTab1Label.text = "Tab 2"
        }
    }
    
    @IBAction internal func segmentValueChangedAtSecondSegmentedControl(_ sender: Any) {
        if segmentedControlWithThreeSegments.selectedSegmentIndex == 0 {
            selectedTab2Label.text = "Tab 1"
        }else if segmentedControlWithThreeSegments.selectedSegmentIndex == 1 {
            selectedTab2Label.text = "Tab 2"
        }else {
            selectedTab2Label.text = "Tab 3"
        }
    }
}
