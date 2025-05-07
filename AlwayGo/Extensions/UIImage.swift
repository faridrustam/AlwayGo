//
//  UIImage.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 26.04.25.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func setImage(with urlString: String?, placeholder: UIImage? = nil) {
            guard let urlString = urlString, let url = URL(string: urlString) else { return }
            self.kf.setImage(with: url, placeholder: placeholder)
        }
}
