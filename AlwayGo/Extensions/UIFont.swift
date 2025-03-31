//
//  Font.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 31.03.25.
//

import Foundation
import UIKit

extension UIFont {
    
    enum Fonts: String {
        case sfProBold = "SFProText-Bold"
        case sfProSemibold = "SFProText-Semibold"
        case sfProRegular = "SFProText-Regular"
        case sfProMedium = "SFProText-Medium"
        case sfProHeavy = "SFProText-Heavy"
    }
    
    static func customFont(_ name: Fonts, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
