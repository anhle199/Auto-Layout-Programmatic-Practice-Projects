//
//  UIStackView+Extensions.swift
//  Quizzler
//
//  Created by Le Hoang Anh on 23/10/2021.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
