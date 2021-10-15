//
//  UIButton+Extensions.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 15/10/2021.
//

import UIKit

extension UIButton {
    func configAnswerButton(
        title: String = "",
        titleColor: UIColor = .black,
        backgroundColor: UIColor = .white,
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .black
    ) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
