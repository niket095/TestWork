//
//  UIButton + Extension.swift
//  TestWork
//
//  Created by Nikita Putilov on 18.11.2024.
//

import UIKit

extension UIButton {
    
    convenience init(text: String, color: UIColor) {
        self.init(type: .system)
        
        self.setTitle(text, for: .normal)
        self.tintColor = .black
        self.backgroundColor = color
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.titleLabel?.numberOfLines = 2
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

