//
//  Coordinator.swift
//  AlwayGo
//
//  Created by Mac on 07.03.25.
//

import UIKit
import Foundation

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
