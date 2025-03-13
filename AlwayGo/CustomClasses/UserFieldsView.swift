//
//  UserFields.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import UIKit

class UserFieldsView: UIView {
    
    func setup() {
        self.backgroundColor = .lightGray
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: bounds.width),
            self.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
