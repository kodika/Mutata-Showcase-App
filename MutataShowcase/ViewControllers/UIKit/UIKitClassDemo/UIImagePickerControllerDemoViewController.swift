//
//  UIImagePickerControllerDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 30/9/21.
//

import Foundation
import UIKit

final class UIImagePickerControllerDemoViewController: UIViewController, UIViewControllerRequiredInitProtocol, UINavigationControllerDelegate {

    @IBOutlet internal var openCameraButton: UIButton!
    @IBOutlet internal var openImagePickerButton: UIButton!
    @IBOutlet internal var photoFromLibraryImageView: UIImageView!
    @IBOutlet internal var cameraImageView: UIImageView!
    @IBOutlet internal var containerView1: UIView!
    @IBOutlet internal var containerView2: UIView!
    
    private var openCameraPressed = false
    private var openPhotosPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Image Picker and Camera"
        
        setupButtons()
        setupContainerViews()
    }

    private func setupButtons() {
        [openCameraButton, openImagePickerButton].forEach({$0?.layer.cornerRadius = 8})
    }
    
    private func setupContainerViews() {
        for containerView in [containerView1, containerView2] {
            containerView?.layer.cornerRadius = 8
            containerView?.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerView?.layer.shadowRadius = 14
            containerView?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
            containerView?.layer.shadowOpacity = 1
        }
    }
    
    @IBAction internal func pickImagePressed(_ sender: Any) {
        openCameraPressed = false
        openPhotosPressed = true
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction internal func openCameraPressed(_ sender: Any) {
        openCameraPressed = true
        openPhotosPressed = false
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension UIImagePickerControllerDemoViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        #if !ANDROID //In Android the ImagePickerController is dismissed automatically
        picker.dismiss(animated: true, completion: nil)
        #endif
        
        if let image = info[.originalImage] as? UIImage {
            if openCameraPressed {
                cameraImageView.image = image
            }else if openPhotosPressed {
                photoFromLibraryImageView.image = image
            }
        }
        openCameraPressed = false
        openPhotosPressed = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        #if !ANDROID //In Android the ImagePickerController is dismissed automatically
        picker.dismiss(animated: true, completion: nil)
        #endif
        
        openCameraPressed = false
        openPhotosPressed = false
        
        let alertController = UIAlertController(title: "Image selection cancelled", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
}
