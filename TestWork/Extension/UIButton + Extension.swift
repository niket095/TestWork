//
//  UIButton + Extension.swift
//  TestWork
//
//  Created by Nikita Putilov on 18.11.2024.
//

import UIKit

extension UIButton {
    
    convenience init(text: String, tcolor: UIColor, color: UIColor) {
        self.init(type: .system)
        
        self.setTitle(text, for: .normal)
        self.tintColor = tcolor
        self.backgroundColor = color
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 5
        self.layer.cornerRadius = 20
        self.titleLabel?.numberOfLines = 2
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

