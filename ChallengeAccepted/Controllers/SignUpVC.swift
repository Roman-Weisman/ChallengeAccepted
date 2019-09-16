//
//  SingUpVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/6/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit
import CoreData

class SignUpVC : UIViewController, HandleTapDelegate {

    // MARK: - Properties
    
    var textFieldArray: [UITextField] = []
    var textFieldFlash: [CustomTextField] = []
    var userTextField: CustomTextField!
    var emailTextField: CustomTextField!
    let userPlaceHolder = "Enter User Name"
    let emailPlaceHolder = "Enter Password"
    var delegate: HandleTapDelegate!

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureMenu()
        configureStackView()
        //nameText.becomeFirstResponder()
    }
    
    // MARK: - Handlers
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    private func configureMenu() {
        userTextField = CustomTextField(placeHolder: userPlaceHolder)
        emailTextField = CustomTextField(placeHolder: emailPlaceHolder)
        
        textFieldArray.append(userTextField)
        textFieldArray.append(emailTextField)
        
    }
    
    private func configureStackView() {
        
        let signUp = CustomButton(imageName: LandingOption.SignUp.imageName, title: String.constants.signUp)
        signUp.delegate = self
        
        let stackView = CustomStackView(arrangedSubviews: textFieldArray)
        stackView.addArrangedSubview(signUp)
        stackView.configureConstraints(view: view, stackView: stackView, width: 280, horizontalFlag: false)
    }
    
    func onTap(tapOn: String) {

        if userTextField.text == "" && emailTextField.text == "" {
            textFieldFlash = [userTextField, emailTextField]
        }
        else if userTextField.text == "" {
            textFieldFlash = [userTextField]
        }
        else if emailTextField.text == "" {
            textFieldFlash = [emailTextField]
        } else {
           //insertUser()
            delegate.onTap(tapOn: String.constants.signIn)
            view.removeFromSuperview()
            navigationController?.view.removeFromSuperview()
            removeFromParent()
        }
        
        if textFieldFlash.count > 0 {
            flash(textFiledArray: textFieldFlash)
            textFieldFlash.removeAll()
        }
    }
    
    private func flash(textFiledArray: [CustomTextField]) {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseOut], animations: {
            for item in textFiledArray {
                item.backgroundColor = .red
            }
            
        }, completion: {
            finished in
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                for item in textFiledArray {
                    item.backgroundColor = .white
                }
            }, completion: nil)
        })
    }
    
    private func insertUser() {
        let myCoreData : MyCoreData = MyCoreData.getInstance
        let user : User  = myCoreData.insert(EntityName: "User") as! User
        
        user.name = userTextField.text
        user.email = emailTextField.text

        myCoreData.save()
    }
}
