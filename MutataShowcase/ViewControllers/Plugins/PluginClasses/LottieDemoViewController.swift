//
//  LottieDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit
import Lottie

final class LottieDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var containerView: UIView!
    @IBOutlet internal var lottieAnimationViewContainerView: UIView!
    private var lottieAnimationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Lottie"
        
        setupContainerView()
        setupLottieAnimationView()
    }
    
    private func setupLottieAnimationView() {
        lottieAnimationView = AnimationView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        lottieAnimationView.animationSpeed = 0.5
        lottieAnimationView.loopMode = .autoReverse
        lottieAnimationViewContainerView.addSubview(lottieAnimationView)
        
        Animation.loadedFrom(url: URL(string: "https://assets7.lottiefiles.com/packages/lf20_kqfglvmb.json")!, closure: { [weak self] (animation) in
            self?.lottieAnimationView.animation = animation
            self?.lottieAnimationView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
        
        NSLayoutConstraint(item: lottieAnimationView!, attribute: .leading, relatedBy: .equal, toItem: lottieAnimationViewContainerView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: lottieAnimationView!, attribute: .trailing, relatedBy: .equal, toItem: lottieAnimationViewContainerView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: lottieAnimationView!, attribute: .top, relatedBy: .equal, toItem: lottieAnimationViewContainerView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: lottieAnimationView!, attribute: .bottom, relatedBy: .equal, toItem: lottieAnimationViewContainerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    private func setupContainerView() {
        containerView.layer.masksToBounds = false
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowRadius = 14
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        containerView.layer.shadowOpacity = 1
    }
}
