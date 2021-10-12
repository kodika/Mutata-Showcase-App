//
//  ListPluginClassesViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import Foundation
import UIKit

class ListPluginClassesViewController: UIViewController {
    
    override var title: String? {
        get {
            return "Plugins"
        }set { }
    }
    
    private var datasource: ListPluginClassesDatasource!
    //MARK: - IBOutlets
    @IBOutlet internal var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = ListPluginClassesDatasource()
        tableView.register(UINib(nibName: "GeneralClassListCell", bundle: nil), forCellReuseIdentifier: "GeneralClassListCell")
    }
}

//MARK: - UITableViewDataSource
extension ListPluginClassesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.numberOfUIKitClasses()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralClassListCell", for: indexPath) as! GeneralClassListCell
        cell.generalClass = datasource.pluginClass(atIndex: indexPath.row)
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ListPluginClassesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let uiviewControllerToBePushed = datasource.pluginClass(atIndex: indexPath.row).uiViewControllerClass.init()
        self.navigationController?.pushViewController(uiviewControllerToBePushed, animated: true)
    }
}
