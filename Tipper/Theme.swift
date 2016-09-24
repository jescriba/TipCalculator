//
//  Theme.swift
//  Tipper
//
//  Created by Joshua Escribano on 9/23/16.
//  Copyright © 2016 Joshua Escribano. All rights reserved.
//

import Foundation
import UIKit

enum ThemeType: Int {
    case light, dark
}

struct LightColors: Colors {
    let backgroundColor = UIColor(red:0.78, green:0.87, blue:1.00, alpha:1.0)
    let labelFontColor = UIColor(red:0.23, green:0.45, blue:0.70, alpha:1.0)
    let totalLabelFontColor = UIColor(red:0.24, green:0.38, blue:1.00, alpha:1.0)
    let totalContainerColor = UIColor(red:0.61, green:0.76, blue:1.00, alpha:1.0)
}

struct DarkColors: Colors {
    let backgroundColor = UIColor(red:0.26, green:0.33, blue:0.60, alpha:1.0)
    let labelFontColor = UIColor(red:0.84, green:0.95, blue:0.96, alpha:1.0)
    let totalLabelFontColor = UIColor(red:0.94, green:0.96, blue:0.95, alpha:1.0)
    let totalContainerColor = UIColor(red:0.24, green:0.30, blue:0.55, alpha:1.0)
}

protocol Colors {
    var backgroundColor: UIColor { get }
    var labelFontColor: UIColor { get }
    var totalLabelFontColor: UIColor { get }
    var totalContainerColor: UIColor { get }
}

class Theme {
    static var currentTheme: Int = UserDefaults.standard.integer(forKey: "ThemeSegmentIndex")
    static func ThemeColors() -> Colors {
        if (currentTheme == ThemeType.light.rawValue) {
            return LightColors()
        } else {
            return DarkColors()
        }
    }
}
