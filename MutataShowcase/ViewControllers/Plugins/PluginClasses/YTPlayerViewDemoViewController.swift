//
//  YTPlayerViewDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import Foundation
import youtube_ios_player_helper

final class YTPlayerViewDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var containerView: UIView!
    private var ytPlayerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "YouTube Player"
        
        setYTPlayerView()
        setupContainerView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let _ = self.ytPlayerView.load(withVideoId: "AAgPpSKAS74", playerVars: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.ytPlayerView.stopVideo()
    }
    
    private func setYTPlayerView() {
        self.ytPlayerView = YTPlayerView(frame: .zero)
        self.ytPlayerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(ytPlayerView)
        
        NSLayoutConstraint(item: ytPlayerView!, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: ytPlayerView!, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: ytPlayerView!, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: ytPlayerView!, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowRadius = 14
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        containerView.layer.shadowOpacity = 1
    }
}
