//
//  UIImage + Extension.swift
//  TestWork
//
//  Created by Nikita Putilov on 18.11.2024.
//

import UIKit

extension UIImageView {
    
    convenience init(image: String, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = UIImage(named: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //CornerRadius
    convenience init(image: String,
                     contentMode: UIView.ContentMode,
                     borderColor: CGColor,
                     cornerRadius: CGFloat,
                     borderWidth: CGFloat) {
        self.init()
        
        self.image = UIImage(named: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
