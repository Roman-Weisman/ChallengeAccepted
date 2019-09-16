//
//  CustomButton.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/11/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    // MARK: - Parameters
    
    var delegate: HandleTapDelegate!
    var title: String!
    var imageName: String!
    
    // MARK: - Init
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
        self.title = title
        self.imageName = imageName
        setShadow()
        configureButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil  {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: (bounds.width-35))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
    
    // For story board
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers

    private func configureButton() {
        
        titleLabel?.font     = UIFont(name: "Kailasa", size: 14)
        //layer.cornerRadius = 25
        layer.borderWidth    = 0.25
        layer.borderColor    = UIColor.constants.color.buttonBorderColor.cgColor
        backgroundColor      = UIColor.constants.color.buttonColor
        
        setTitle(title, for: .normal)
        setTitleColor(UIColor.constants.color.buttonTitleColor, for: .normal)
        setImage(UIImage(named: imageName), for: .normal)
        
        addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)//,
            //widthAnchor.constraint(equalToConstant: 280)
            ])
    }
    
    func configurePublicConstraints(height: CGFloat, width: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
            ])
        
    }
    
    private func shake() {
        let shake          = CABasicAnimation(keyPath: "position")
        shake.duration     = 0.1
        shake.repeatCount  = 2
        shake.autoreverses = true
        
        let fromPoint      = CGPoint(x: center.x - 8, y: center.y)
        let fromValue      = NSValue(cgPoint: fromPoint)
        
        let toPoint        = CGPoint(x: center.x + 8 , y: center.y)
        let toValue        = NSValue(cgPoint: toPoint)
        
        shake.fromValue    = fromValue
        shake.toValue      = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.darkGray.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 4.0)
        //layer.shadowRadius  = 8
        layer.shadowOpacity = 0.45
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    @objc func onTap() {
        if self.title == "Sign In" {
            delegate.onTap(tapOn: String.constants.signIn)
        } else if self.title == "Sign Up" {
            delegate.onTap(tapOn: String.constants.signUp)
        } else {
            shake()
        }
    }
}
