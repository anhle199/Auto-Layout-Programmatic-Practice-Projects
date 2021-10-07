//
//  Constants.swift
//  Xylophone
//
//  Created by Le Hoang Anh on 07/10/2021.
//

import UIKit

struct Constants {
    struct Button {
        static let titles = ["C", "D", "E", "F", "G", "A", "B"]
        static let font = UIFont.systemFont(ofSize: 40, weight: .regular)
        
        /// The value of `key` is button title, the value of `value` is button background color.
        static let colors = [
            "C": UIColor(red: 255 / 255.0, green: 59 / 255.0, blue: 48 / 255.0, alpha: 1),
            "D": UIColor(red: 255 / 255.0, green: 149 / 255.0, blue: 0 / 255.0, alpha: 1),
            "E": UIColor(red: 255 / 255.0, green: 204 / 255.0, blue: 2 / 255.0, alpha: 1),
            "F": UIColor(red: 53 / 255.0, green: 199 / 255.0, blue: 89 / 255.0, alpha: 1),
            "G": UIColor(red: 88 / 255.0, green: 86 / 255.0, blue: 213 / 255.0, alpha: 1),
            "A": UIColor(red: 0 / 255.0, green: 122 / 255.0, blue: 255 / 255.0, alpha: 1),
            "B": UIColor(red: 175 / 255.0, green: 82 / 255.0, blue: 222 / 255.0, alpha: 1)
        ]
    }
    
    struct Sound {
        /// The value of `key` is button title, the value of `value` is file name.
        static let filenames = [
            "C": "C",
            "D": "D",
            "E": "E",
            "F": "F",
            "G": "G",
            "A": "A",
            "B": "B"
        ]
        static let `extension` = "wav"
    }
}
