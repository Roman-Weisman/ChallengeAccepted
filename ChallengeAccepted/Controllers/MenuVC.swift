//
//  MenuVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/8/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, HandleTapDelegate {

    // MARK: - Properties
    
    var btnArray: [CustomButton]!
    var stackView: CustomStackView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureMenu()
        configureStackView()
    }
    
    // MARK: - Handlers
    
    private func configureView() {
        view.backgroundColor = UIColor.constants.color.menuBackgroundColor
        view.frame = CGRect(x: 0-Int.constants.menuWidh, y: 0, width: Int.constants.menuWidh, height: view.frame.height)
    }
    
    private func configureMenu() {
        btnArray = []
        
        for item in MenuOption.array {
            let btn = CustomButton(imageName: item.imageName, title: item.description)
            btn.delegate = self
            btnArray.append(btn)
        }
    }
    
    private func configureStackView() {
        stackView = CustomStackView(arrangedSubviews: btnArray)
        stackView.configureConstraints(view: view, stackView: stackView, width: view.frame.width, horizontalFlag: false)
    }
    
    func onTap(tapOn: String) {
        print("Tap was done from CustomButton and invoked current delegate")
    }
}
