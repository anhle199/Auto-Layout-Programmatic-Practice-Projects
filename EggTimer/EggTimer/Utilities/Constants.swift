//
//  Constants.swift
//  EggTimer
//
//  Created by Le Hoang Anh on 08/10/2021.
//

import UIKit

struct Constants {
    
    struct ButtonTitle {
        static let softEgg = "Soft"
        static let mediumEgg = "Medium"
        static let hardEgg = "Hard"
    }
    
    struct Images {
        static let softEgg = "soft_egg"
        static let mediumEgg = "medium_egg"
        static let hardEgg = "hard_egg"
    }
    
    struct Sounds {
        static let alarm = "alarm_sound.mp3"
    }
    
    struct Colors {
        static let background = UIColor(red: 203 / 255.0, green: 242 / 255.0, blue: 252 / 255.0, alpha: 1)
    }
    
    struct BurningTime {
        static let softEgg = 10
        static let mediumEgg = 15
        static let hardEgg = 20
    }
    
    static let titleLabelBeforeBurning = "How do you like your eggs?"
    static let titleLabelBurnFinished = "DONE!!!"
    
}
