//
//  CustomStackView.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/12/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit

class CustomStackView: UIStackView {
    // MARK: - Parameters
    var view: UIView!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    // For story board
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    private func configureStackView() {
        axis = .vertical
        alignment = .fill
        spacing = 50
        distribution = .fillEqually
    }
    
    func configureConstraints(view: UIView, stackView: UIStackView, width: CGFloat, horizontalFlag: Bool) {
        if horizontalFlag {
            axis = .horizontal
        }
        self.view = view
        view.addSubview(stackView)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
            widthAnchor.constraint(equalToConstant: width - 20)
            ])
    }
}
