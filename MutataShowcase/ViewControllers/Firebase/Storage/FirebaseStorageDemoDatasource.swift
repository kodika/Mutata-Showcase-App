//
//  FirebaseStorageDemoDatasource.swift
//  MutataShowcase
//
//  Created by Kodika.io on 28/9/21.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

public protocol FirebaseStorageDemoDatasourceDelegate: class {
    func imagesFetchedSuccessfully()
    func imagesFetchFailed(error: Error?)
}

public class FirebaseStorageDemoDatasource {
    
    public weak var delegate: FirebaseStorageDemoDatasourceDelegate?
    
    //MARK: - Private variables
    private var images: [UIImage]
    private var storageReference: StorageReference
    private var imagesStorageReference: StorageReference
    private let fileManager = FileManager.default
    
    public init() {
        self.storageReference = Storage.storage().reference()
        self.imagesStorageReference = storageReference.child("Images")
        self.images = []
    }
    
    public func fetchImagesFromStorage() {
        self.images = []
        
        var isDirectory: ObjCBool = true
        if !fileManager.fileExists(atPath: mutataImagesFolderUrl().absoluteString, isDirectory: &isDirectory) {
            try! fileManager.createDirectory(at: mutataImagesFolderUrl(), withIntermediateDirectories: true, attributes: nil)
        }
        
        Database.database().reference().child("Images").observeSingleEvent(of: .value) { (dataSnapshot) in
            guard let imageNames = dataSnapshot.value as? [String] else {
                self.delegate?.imagesFetchFailed(error: nil)
                return
            }
            imageNames.forEach { (imageName) in
                let imageNameWithPngExtension = imageName + ".png"
                let fileUrlForImageName = self.mutataImagesFolderUrl().appendingPathComponent(imageName).appendingPathExtension("png")
                let _ = self.imagesStorageReference.child(imageNameWithPngExtension).write(toFile: fileUrlForImageName) { (url, error) in
                    if let error = error {
                        self.delegate?.imagesFetchFailed(error: error)
                        return
                    }
                    let imageData = try! Data(contentsOf: URL(fileURLWithPath: fileUrlForImageName.path))
                    self.images.append(UIImage(data: imageData, scale: 3)!)
                    if self.images.count == imageNames.count {
                        self.delegate?.imagesFetchedSuccessfully()
                    }
                }
            }
        }
    }
    
    public func deleteAllDownloadedImages() {
        try? fileManager.removeItem(atPath: mutataImagesFolderUrl().path)
    }
    
    public func numberOfImages() -> Int {
        return images.count
    }
    
    public func image(at index: Int) -> UIImage {
        return images[index]
    }
    
    //MARK: - Private helper functions
    private func mutataImagesFolderUrl() -> URL {
        let documentFolderUrl = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let mutataFolderUrl = documentFolderUrl.appendingPathComponent("Mutata")
        return mutataFolderUrl.appendingPathComponent("Images", isDirectory: true)
    }
}
