//
//  ViewController.swift
//  SighInWithApple
//
//  Created by Kevin on 2022/3/22.
//

import UIKit
import AuthenticationServices

class StartSignInVC: UIViewController {

    @IBOutlet weak var signInBtnView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authorizationAppleIDButton = ASAuthorizationAppleIDButton()
        authorizationAppleIDButton.addTarget(self, action: #selector(signInWithAppleButtonPressed), for: .touchUpInside)
        authorizationAppleIDButton.frame = self.signInBtnView.bounds
        self.signInBtnView.addSubview(authorizationAppleIDButton)
    }

    @objc func signInWithAppleButtonPressed() {
        let authorizationAppleIDRequest = ASAuthorizationAppleIDProvider().createRequest()
        authorizationAppleIDRequest.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [authorizationAppleIDRequest])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
}

extension StartSignInVC: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
                
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            print("user: \(appleIDCredential.user)")
            print("fullName: \(String(describing: appleIDCredential.fullName))")
            print("Email: \(String(describing: appleIDCredential.email))")
            print("realUserStatus: \(String(describing: appleIDCredential.realUserStatus))")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
                
        switch (error) {
        case ASAuthorizationError.canceled:
            break
        case ASAuthorizationError.failed:
            break
        case ASAuthorizationError.invalidResponse:
            break
        case ASAuthorizationError.notHandled:
            break
        case ASAuthorizationError.unknown:
            break
        default:
            break
        }
                    
        print("didCompleteWithError: \(error.localizedDescription)")
    }
    
}

extension StartSignInVC: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
           return self.view.window!
    }
    
}
