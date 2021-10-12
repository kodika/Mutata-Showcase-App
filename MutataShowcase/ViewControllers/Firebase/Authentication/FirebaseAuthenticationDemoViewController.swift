//
//  FirebaseAuthenticationDemoViewController.swift
//  MutataShowcase
//
//  Created by Kodika.io on 27/9/21.
//

import UIKit
import MBProgressHUD
import FirebaseAuth

class FirebaseAuthenticationDemoViewController: UIViewController {
    
    override var title: String? {
        get {
            return "Firebase"
        }set { }
    }
    
    //MARK: - IBOutlets
    @IBOutlet internal var emailContainerView: UIView!
    @IBOutlet internal var passwordContainerView: UIView!
    @IBOutlet internal var emailTextField: UITextField!
    @IBOutlet internal var passwordTextField: UITextField!
    @IBOutlet internal var signUpButton: UIButton!
    @IBOutlet internal var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseStorageDemoDatasource().deleteAllDownloadedImages()
        try! Auth.auth().signOut()
        
        setupButtons()
        setupContainerViews()
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupButtons() {
        [signUpButton, signInButton].forEach({$0?.layer.cornerRadius = 4})
    }
    
    private func setupContainerViews() {
        for view in [emailContainerView, passwordContainerView] {
            view?.layer.cornerRadius = 4
            view?.layer.borderWidth = 1
            view?.layer.borderColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1).cgColor
        }
    }
    
    #if !ANDROID //Keyboard in Android has specific button to dismiss it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    #endif

    //MARK: - IBActions
    @IBAction internal func signUpPressed(_ sender: Any) {
        if getEmailInCorrectFormat()?.isEmpty ?? true {
            let alertController = UIAlertController(title: "An email address is necessary to sign up", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }else if passwordTextField.text?.isEmpty ?? true {
            let alertController = UIAlertController(title: "A password is necessary to sign up", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }else {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            let email = getEmailInCorrectFormat()!
            let password = passwordTextField.text!
            Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if let error = error {
                    let alertController = UIAlertController(title: "Error occured when trying to sign up", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }else {
                    self.pushFirebaseStorageDemoViewControllerToNavigationController()
                }
            }
        }
    }
    
    @IBAction internal func signInPressed(_ sender: Any) {
        if getEmailInCorrectFormat()?.isEmpty ?? true {
            let alertController = UIAlertController(title: "An email address is necessary to sign in", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }else if passwordTextField.text?.isEmpty ?? true {
            let alertController = UIAlertController(title: "A password is necessary to sign in", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }else {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            let email = getEmailInCorrectFormat()!
            let password = passwordTextField.text!
            Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if let error = error {
                    let alertController = UIAlertController(title: "Error occured when trying to sign in", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }else {
                    self.pushFirebaseStorageDemoViewControllerToNavigationController()
                }
            }
        }
    }
    
    //MARK: - Private helper functions
    private func getEmailInCorrectFormat() -> String? {
        if let emailTextFieldText = emailTextField.text {
            return emailTextFieldText.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return nil
    }
    
    private func pushFirebaseStorageDemoViewControllerToNavigationController() {
        let firebaseStorageDemoViewController = FirebaseStorageDemoViewController(nibName: "FirebaseStorageDemoViewController", bundle: nil)
        self.navigationController?.pushViewController(firebaseStorageDemoViewController, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension FirebaseAuthenticationDemoViewController: UITextFieldDelegate {
    #if !ANDROID //Keyboard in Android has specific button to dismiss it
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    #endif
}
