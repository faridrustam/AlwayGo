//
//  UIStackView.swift
//  AlwayGo
//
//  Created by Mac on 05.04.25.
//

import UIKit
import Foundation

extension UIStackView {
    func addArrangedSubViews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
