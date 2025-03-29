//
//  UIView.swift
//  AlwayGo
//
//  Created by Mac on 29.03.25.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
