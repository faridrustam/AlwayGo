//
//  BaseControllerController.swift
//  AlwayGo
//
//  Created by Farid Rustamov on 07.03.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureviewModel()
    }
    
    func configureUI() {}
    
    func configureConstraints() {}
    
    func configureviewModel() {}
}
