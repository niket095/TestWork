//
//  UILable + Extension.swift
//  TestWork
//
//  Created by Nikita Putilov on 24.11.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont, color: UIColor, line: Int) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = color
        self.numberOfLines = line
        
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
