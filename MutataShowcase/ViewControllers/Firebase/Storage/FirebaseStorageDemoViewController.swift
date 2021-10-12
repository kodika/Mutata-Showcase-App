//
//  FirebaseStorageDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 28/9/21.
//

import Foundation
import Foundation
import UIKit
import FirebaseAuth
import MBProgressHUD

class FirebaseStorageDemoViewController: UIViewController {

    public var datasource: FirebaseStorageDemoDatasource!
    
    //MARK: - IBOutlets
    @IBOutlet internal var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Firebase Database & Storage"
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        datasource = FirebaseStorageDemoDatasource()
        datasource.delegate = self
        datasource.fetchImagesFromStorage()
        
        collectionView.register(UINib(nibName: "FirebaseStorageDemoCell", bundle: nil), forCellWithReuseIdentifier: "FirebaseStorageDemoCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        datasource.deleteAllDownloadedImages()
        try! Auth.auth().signOut()
    }
}

//MARK: - UICollectionViewDataSource
extension FirebaseStorageDemoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.numberOfImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirebaseStorageDemoCell", for: indexPath) as! FirebaseStorageDemoCell
        cell.storageImage = datasource.image(at: indexPath.row)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension FirebaseStorageDemoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
}

//MARK: - FirebaseStorageDemoDatasourceDelegate
extension FirebaseStorageDemoViewController: FirebaseStorageDemoDatasourceDelegate {
    func imagesFetchedSuccessfully() {
        collectionView.reloadData()
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func imagesFetchFailed(error: Error?) {
        MBProgressHUD.hide(for: self.view, animated: true)
        
        let alertController = UIAlertController(title: "Fetching images from Firebase Storage failed!", message: error?.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
