//
//  HomeVC.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/6/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class HomeVC : UIViewController {
    
    // MARK: - Properties
    
    var delegate : HandleTapDelegate!
    var bView: UIView!
    var menuVC: MenuVC!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureNavigationBar()
        getUser()
    }

    
    // MARK: - Handlers
    
    private func configureView() {
        navigationController?.navigationBar.barTintColor = UIColor.constants.color.menuBackgroundColor
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .white
        
        let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(backToLanding))
        navigationItem.leftBarButtonItem = back
        
        if bView == nil {
            bView = UIView()
            bView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            view.addSubview(bView)
            bView.frame = view.frame
            bView.alpha = 0
        }
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(getSlideMenu))
        swipe.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipe)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismisser))
        view.addGestureRecognizer(tap)
    }
    
    private func configureNavigationBar() {
        navigationItem.title = String.constants.homeTitle
    }
    
    @objc private func backToLanding() {
        delegate.onTap(tapOn: String.constants.landing)
        view.removeFromSuperview()
        navigationController?.view.removeFromSuperview()
        removeFromParent()
    }
    
    @objc private func getSlideMenu() {
        
        if menuVC == nil {
            menuVC = MenuVC()
            view.insertSubview(menuVC.view, at: 2)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.bView.alpha = 1
            self.menuVC.view.frame.origin.x = 0
        }
    }
    
    @objc private func dismisser() {
        UIView.animate(withDuration: 0.5) {
            self.bView.alpha = 0
            self.menuVC.view.frame.origin.x = 0-Int.constants.menuWidh
        }
    }
    
    private func getUser() {
        let lableArray : [UILabel]!
        let lblText = UILabel()
        let lblUserFromCoreData = UILabel()
        
        lblText.text = "From core data:"
       
        
        
        // This is just a demonstration of searching in core data for a user that loged in as Roman, that's why Roman is harcoded
        //let myCoreData : MyCoreData = MyCoreData.getInstance
        //lblUserFromCoreData.text = myCoreData.get(ParamToSearcheBy: "Roman")
        lblUserFromCoreData.text = "Roman"
        
        lableArray = [lblText, lblUserFromCoreData]
        let stackView = CustomStackView(arrangedSubviews: lableArray)
        stackView.configureConstraints(view: view, stackView: stackView, width: view.frame.width, horizontalFlag: true)
    }
}
