//
//  UserFields.swift
//  AlwayGo
//
//  Created by Mac on 12.03.25.
//

import UIKit

class UserFieldsView: UIView {
    
    func setup() {
//        let border = CALayer()
//        let height = CGFloat(0.3)
        self.backgroundColor = .gray
//        border.frame = CGRect(x: 0, y: bounds.height - height, width: bounds.width, height: height)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: bounds.width),
            self.heightAnchor.constraint(equalToConstant: 1),
        ])
//        self.layer.addSublayer(border)
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
