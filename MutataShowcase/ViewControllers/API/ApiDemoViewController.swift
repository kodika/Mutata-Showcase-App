//
//  ApiDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import Alamofire
import Foundation
import MBProgressHUD

class ApiDemoViewController: UIViewController {
    
    override var title: String? {
        get {
            return "API"
        }set { }
    }
    
    //MARK: - IBOutlets
    @IBOutlet internal var postRequestButton: UIButton!
    @IBOutlet internal var responseTextView: UITextView!
    @IBOutlet internal var jsonContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPostRequestButton()
        setupJsonContainerView()
    }
    
    private func setupJsonContainerView() {
        jsonContainerView.layer.cornerRadius = 4
        jsonContainerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        jsonContainerView.layer.shadowRadius = 14
        jsonContainerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        jsonContainerView.layer.shadowOpacity = 1
    }
    
    private func setupPostRequestButton() {
        self.postRequestButton.layer.cornerRadius = 4
    }
    
    //MARK: - IBActions
    @IBAction internal func sendRequestPressed(_ sender: Any) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        AF.request("https://mutata-showcase-default-rtdb.europe-west1.firebasedatabase.app/.json?print=pretty",
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil).response { (dataResponse) in
                    
                    MBProgressHUD.hide(for: self.view, animated: true)
                    
                    guard dataResponse.error == nil else {
                        let alertController = UIAlertController(title: "Error in GET request",
                                                                message: dataResponse.error?.localizedDescription,
                                                                preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        return
                    }
                    
                    guard let data = dataResponse.data else {
                        let alertController = UIAlertController(title: "No response data",
                                                                message: dataResponse.error?.localizedDescription,
                                                                preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        return
                    }
                    
                    let stringResponseValue = String(data: data, encoding: .utf8)
                    self.responseTextView.text = stringResponseValue
                   }
    }
}
