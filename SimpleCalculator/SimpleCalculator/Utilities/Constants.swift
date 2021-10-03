//
//  Constants.swift
//  SimpleCalculator
//
//  Created by Le Hoang Anh on 03/10/2021.
//

import UIKit

struct Constants {
    
    struct CalculatorButton {
        static let font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        struct Color {
            static let numberButton = UIColor(red: 26 / 255.0, green: 173 / 255.0, blue: 248 / 255.0, alpha: 1)
            static let operationButton = UIColor(red: 255 / 255.0, green: 147 / 255.0, blue: 0 / 255.0, alpha: 1)
            static let functionButton = UIColor.darkGray
            static let specialSignButton = UIColor(red: 26 / 255.0, green: 173 / 255.0, blue: 248 / 255.0, alpha: 1)
        }
        
        enum Number: String {
            case zero = "0"
            case one = "1"
            case two = "2"
            case three = "3"
            case four = "4"
            case five = "5"
            case six = "6"
            case seven = "7"
            case eight = "8"
            case nine = "9"
            
            var title: String {
                return self.rawValue
            }
        }
        
        enum Operation: String {
            case equal = "="
            case add = "+"
            case subtract = "-"
            case multiply = "*"
            case divide = "÷"
            
            var title: String {
                return self.rawValue
            }
        }
        
        enum Function: String {
            case allClear = "AC"
            case negateButton = "+/-"
            case percent = "%"
            
            var title: String {
                return self.rawValue
            }
        }

        enum SpecialSign: String {
            case dot = "."
            
            var title: String {
                return self.rawValue
            }
        }
        
    }

}
