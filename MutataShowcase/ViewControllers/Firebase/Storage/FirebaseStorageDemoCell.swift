//
//  FirebaseStorageDemoCell.swift
//  MutataShowcase
//
//  Created by Kodika.io on 28/9/21.
//

import UIKit

class FirebaseStorageDemoCell: UICollectionViewCell {

    public var storageImage: UIImage! {
        didSet {
            imageView.image = storageImage
        }
    }
    
    //MARK: - IBOutlet
    @IBOutlet internal var containerView: UIView!
    @IBOutlet internal var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 8
    }
}
