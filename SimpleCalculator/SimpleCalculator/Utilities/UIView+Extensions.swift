//
//  UIView+Extensions.swift
//  SimpleCalculator
//
//  Created by Le Hoang Anh on 03/10/2021.
//

import UIKit

extension UIView {
 
    func addSubViews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    
}
