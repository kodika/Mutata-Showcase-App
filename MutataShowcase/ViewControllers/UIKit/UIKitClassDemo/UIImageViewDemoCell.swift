//
//  UIImageViewDemoCell.swift
//  MutataShowcase
//
//  Created by Kodika.io on 1/10/21.
//

import UIKit
import Foundation

class UIImageViewDemoCell: UITableViewCell {

    public var imageViewContentMode: UIView.ContentMode? {
        didSet {
            if let imageViewContentMode = imageViewContentMode {
                exampleImageView.image = UIImage(named: "contentmodeexampleimage")
                exampleImageView.contentMode = imageViewContentMode
                switch imageViewContentMode {
                case .scaleToFill:
                    titleLabel.text = "Scale To Fill"
                    subtitleLabel.text = nil
                case .scaleAspectFit:
                    titleLabel.text = "Scale Aspect Fit"
                    subtitleLabel.text = nil
                case .scaleAspectFill:
                    titleLabel.text = "Scale Aspect Fill"
                    subtitleLabel.text = nil
                default:
                    fatalError("Not handled")
                }
            }else {
                titleLabel.text = "Loaded from URL:"
                exampleImageView.af.setImage(withURL: URL(string: "https://mutata.io/showcase-app/demo-image.png")!)
            }
        }
    }
    
    @IBOutlet internal var titleLabel: UILabel!
    @IBOutlet internal var subtitleLabel: UILabel!
    @IBOutlet internal var exampleImageView: UIImageView!
    @IBOutlet internal var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowRadius = 14
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        containerView.layer.shadowOpacity = 1
    }
}
