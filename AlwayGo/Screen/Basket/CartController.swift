//
//  CartController.swift
//  AlwayGo
//
//  Created by Mac on 09.03.25.
//

import UIKit

class CartController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        navigationItem.title = "FAVORITES"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "SFProText-Semibold", size: 16) ?? "",
                                                                   .foregroundColor: UIColor.black]
    }
    
    override func configureConstraints() {
         
    }
}

#Preview {
    CartController()
}
