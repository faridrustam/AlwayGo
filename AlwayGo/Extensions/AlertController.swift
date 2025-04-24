//
//  AlertController.swift
//  AlwayGo
//
//  Created by Mac on 24.04.25.
//

import UIKit
import Foundation

extension UIViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Please enter valid email or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
