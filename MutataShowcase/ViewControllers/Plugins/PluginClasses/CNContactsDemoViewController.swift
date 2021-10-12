//
//  CNContactsDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 30/9/21.
//

import UIKit
import Contacts
import Foundation
import MBProgressHUD

final class CNContactsDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol {

    @IBOutlet internal var tableView: UITableView!
    private var contacts: [CNContact] = [] {
        didSet {
            #if ANDROID
            DispatchQueue.runOnUiThread {
                self.tableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            #else
            DispatchQueue.main.async {
                self.tableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            #endif
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contacts"
        
        tableView.register(UINib(nibName: "CNContactsDemoCell", bundle: nil), forCellReuseIdentifier: "CNContactsDemoCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        CNContactStore().requestAccess(for: .contacts) { (granted, error) in
            
            let keysToFetch = [CNContactGivenNameKey , CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            do {
                var fetchedContacts = [CNContact]()
                
                try CNContactStore().enumerateContacts(with: CNContactFetchRequest(keysToFetch: keysToFetch)) { (contact, _) in
                    fetchedContacts.append(contact)
                }
                
                self.contacts = fetchedContacts
            } catch (let error) {
                self.contacts = []
                
                #if ANDROID
                DispatchQueue.runOnUiThread {
                    let alertController = UIAlertController(title: "Could not fetch contacts", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
                    self.present(alertController, animated: true)

                }
                #else
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Could not fetch contacts", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
                    self.present(alertController, animated: true)
                }
                #endif
            }
        }
    }
}

//MARK: - UITableViewDataSource
extension CNContactsDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CNContactsDemoCell", for: indexPath) as! CNContactsDemoCell
        cell.contact = contacts[indexPath.row]
        
        return cell
    }
}
