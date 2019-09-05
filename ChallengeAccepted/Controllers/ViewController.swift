//
//  ViewController.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/3/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: SAButton!
    
    var context = LAContext()
    var authenticationState = AuthenticationState.loggedout
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        authenticationState = .loggedout
    }

    @IBAction func signInAttempt(_ sender: Any) {
        
        if(authenticationState == .loggedin) {
            authenticationState = .loggedout
        }
        
        var error : NSError?
        context = LAContext()
        context.localizedCancelTitle = "Enter Username/Password"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Log into your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if success {
                    DispatchQueue.main.async { [unowned self] in
                        self.authenticationState = .loggedin
                    }
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
        }
    }
    
}

