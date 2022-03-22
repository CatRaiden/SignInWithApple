//
//  CheckSignInVCViewController.swift
//  SignInWithApple
//
//  Created by Kevin on 2022/3/22.
//

import UIKit

class CheckSignInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        checkSignInValid()
    }
    
    //    private func checkSignInValid() {
    //        let appleIDProvider = ASAuthorizationAppleIDProvider()
    //        appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { (credentialState, error) in
    //            switch credentialState {
    //            case .authorized:
    //                break // The Apple ID credential is valid.
    //            case .revoked, .notFound:
    //                // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
    //                DispatchQueue.main.async {
    //                    self.window?.rootViewController?.showLoginViewController()
    //                }
    //            default:
    //                break
    //            }
    //        }
    //    }
}
