//
//  UIStackView+Extension.swift
//  SimpleCalculator
//
//  Created by Le Hoang Anh on 03/10/2021.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubViews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
}
