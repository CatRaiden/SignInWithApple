//
//  CheckSignInVCViewController.swift
//  SignInWithApple
//
//  Created by Kevin on 2022/3/22.
//

import UIKit
import AuthenticationServices

class CheckSignInVC: UIViewController {
    
    var credential: ASAuthorizationAppleIDCredential?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("user: \(String(describing: credential?.user))")
        print("fullName: \(String(describing: credential?.fullName))")
        print("Email: \(String(describing: credential?.email))")
        print("realUserStatus: \(String(describing: credential?.realUserStatus))")
        
        checkSignInValid()
    }
    
    private func checkSignInValid() {
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { (credentialState, error) in
            switch credentialState {
            case .authorized:
                print("The Apple ID credential is valid.")
                break // The Apple ID credential is valid.
            case .revoked, .notFound:
                // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                print("The Apple ID credential is invalid.")
                DispatchQueue.main.async {
                    KeychainItem.deleteUserIdentifierFromKeychain()
                    self.dismiss(animated: true)
                }
            default:
                break
            }
        }
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
        KeychainItem.deleteUserIdentifierFromKeychain()
        self.dismiss(animated: true)
    }
}
