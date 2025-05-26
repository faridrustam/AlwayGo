//
//  AlertController.swift
//  AlwayGo
//
//  Created by Mac on 24.04.25.
//

import UIKit
import Foundation

extension UIViewController {
    func showAlert(title: String = "Error", message: String = "Please enter valid email or password") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
