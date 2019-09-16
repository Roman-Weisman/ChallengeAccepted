//
//  LandingVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/9/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class LandingVC : UIViewController, HandleTapDelegate {

    // MARK: - Properties
    
    var buttonArray : [CustomButton]!
    var stackView: CustomStackView!
    var delegate: HandleTapDelegate!
    var signUpVC : SignUpVC = SignUpVC()
    let landingTitle: String = String.constants.landingTitle
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureNavigationBar()
        configureMenu()
        configureStackView()
    }

    // MARK: - Handlers
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.constants.color.menuBackgroundColor
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = self.landingTitle
    }
    
    private func configureMenu() {
        buttonArray = []
        for item in LandingOption.array {
            let button = CustomButton(imageName: item.imageName, title: item.description)
            button.delegate = self
            buttonArray.append(button)
        }
    }
    
    private func configureStackView() {
        stackView = CustomStackView(arrangedSubviews: buttonArray)
        stackView.configureConstraints(view: view, stackView: stackView, width: 280, horizontalFlag: false)
    }
    
    private func configureSignUp(_ tapOn: String) {
        view.insertSubview(signUpVC.view, at: 1)
        navigationItem.title = tapOn
        signUpVC.delegate = self
        
        let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(backToLanding))
        navigationItem.leftBarButtonItem = back
    }
    
    @objc private func backToLanding() {
        signUpVC.view.removeFromSuperview()
        signUpVC.navigationController?.view.removeFromSuperview()
        signUpVC.removeFromParent()
        
        navigationItem.title = self.landingTitle
        navigationItem.leftBarButtonItem = nil
    }

    func onTap(tapOn: String) {
        if tapOn == String.constants.signIn {
            delegate.onTap(tapOn: tapOn)
        }
        else if tapOn == String.constants.signUp {
            configureSignUp(tapOn)
        }
    }
}
