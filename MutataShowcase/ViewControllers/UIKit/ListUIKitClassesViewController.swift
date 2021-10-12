//
//  ListUIKitClassesViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit

class ListUIKitClassesViewController: UIViewController {
    
    override var title: String? {
        get {
            return "UIKit"
        }set { }
    }
    
    private var datasource: ListUIKitClassesDatasource!
    @IBOutlet internal var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = ListUIKitClassesDatasource()
        tableView.register(UINib(nibName: "GeneralClassListCell", bundle: nil), forCellReuseIdentifier: "GeneralClassListCell")
    }
}

//MARK: - UITableViewDataSource
extension ListUIKitClassesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.numberOfUIKitClasses()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralClassListCell", for: indexPath) as! GeneralClassListCell
        cell.generalClass = datasource.uiKitClass(atIndex: indexPath.row)
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ListUIKitClassesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let uiviewControllerToBePushed = datasource.uiKitClass(atIndex: indexPath.row).uiViewControllerClass.init()
        self.navigationController?.pushViewController(uiviewControllerToBePushed, animated: true)
    }
}
