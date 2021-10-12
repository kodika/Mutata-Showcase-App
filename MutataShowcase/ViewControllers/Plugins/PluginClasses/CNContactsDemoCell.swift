//
//  CNContactsDemoCell.swift
//  MutataShowcase
//
//  Created by Kodika.io on 30/9/21.
//

import UIKit
import Contacts

class CNContactsDemoCell: UITableViewCell {

    public var contact: CNContact! {
        didSet {
            contactNameLabel.text = contact.givenName
            contactNumberLabel.text = (contact.phoneNumbers.first?.value.stringValue ?? "No phone number provided")
        }
    }
    @IBOutlet internal var contactNameLabel: UILabel!
    @IBOutlet internal var contactNumberLabel: UILabel!
    @IBOutlet internal var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setupContainerView()
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = 8
    }
}
