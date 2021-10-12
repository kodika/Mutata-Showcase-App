//
//  ListUIKitClassesCell.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit

class GeneralClassListCell: UITableViewCell {

    public var generalClass: GeneralClass! {
        didSet {
            uiKitClassNameLabel.text = generalClass.name
            uiKitClassNicknameLabel.text = generalClass.nickname
            uikitClassImageView.image = UIImage(named: generalClass.imageName)
        }
    }
    
    @IBOutlet internal var uiKitClassNameLabel: UILabel!
    @IBOutlet internal var uikitClassImageView: UIImageView!
    @IBOutlet internal var uiKitClassNicknameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
