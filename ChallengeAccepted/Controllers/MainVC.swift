//
//  MainVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/7/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class MainVC: UIViewController, HandleTapDelegate {

    // MARK: - Properties
    
    var landingVC: UIViewController!
    var homeVC : UIViewController!
    var menuVC : MenuVC!
    var lVC : LandingVC!
    var hVC : HomeVC!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLandingVC()
    }
    
    // MARK: - Handlers
    
    private func configureLandingVC() {
        lVC = LandingVC()
        lVC.delegate = self

        landingVC = UINavigationController(rootViewController: lVC)
        view.addSubview(landingVC.view)
        addChild(landingVC)
        landingVC.didMove(toParent: self)
    }

    private func configureHomeVC() {
        hVC = HomeVC()
        hVC.delegate = self

        homeVC = UINavigationController(rootViewController: hVC)
        view.addSubview(homeVC.view)
        addChild(homeVC)
        homeVC.didMove(toParent: self)
    }
    
    func onTap(tapOn: String) {
        if(tapOn == String.constants.signIn) {
            configureHomeVC()
        }
        else if(tapOn == String.constants.landing) {
            configureLandingVC()
        }
    }
}
