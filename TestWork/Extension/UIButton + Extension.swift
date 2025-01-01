//
//  UIButton + Extension.swift
//  TestWork
//
//  Created by Nikita Putilov on 18.11.2024.
//

import UIKit

extension UIButton {
    
    convenience init(text: String, colorBackground: UIColor) {
        self.init(type: .system)
        
        self.setTitle(text, for: .normal)
        self.tintColor = .white
        self.backgroundColor = colorBackground
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 5
        self.layer.cornerRadius = 20
        self.titleLabel?.numberOfLines = 2
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(colorTint: UIColor, image: String, colorBorder: CGColor) {
        self.init(type: .system)
        
        self.tintColor = colorTint
        self.setImage(UIImage(systemName: image), for: .normal)
        self.layer.cornerRadius = 10
        self.layer.borderColor = colorBorder
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        }
}

