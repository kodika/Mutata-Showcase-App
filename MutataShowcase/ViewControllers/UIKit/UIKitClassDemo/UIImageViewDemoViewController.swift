//
//  UIImageViewDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

#if os(Android)
import FoundationNetworking
#endif
import Foundation
import UIKit
import AlamofireImage

final class UIImageViewDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    private let contentModesToShow = [UIView.ContentMode.scaleAspectFill, UIView.ContentMode.scaleAspectFit, UIView.ContentMode.scaleToFill]
    
    //MARK: - IBOutlet
    @IBOutlet internal var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Image View"
        
        tableView.register(UINib(nibName: "UIImageViewDemoCell", bundle: nil), forCellReuseIdentifier: "UIImageViewDemoCell")
    }
}

//MARK: - UITableViewDataSource
extension UIImageViewDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentModesToShow.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIImageViewDemoCell", for: indexPath) as! UIImageViewDemoCell
        cell.imageViewContentMode = (indexPath.row == contentModesToShow.count) ? nil : contentModesToShow[indexPath.row]
        
        return cell
    }
}
