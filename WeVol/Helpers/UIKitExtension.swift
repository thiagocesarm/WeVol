//
//  UIKitExtension.swift
//  WeVol
//
//  Created by Thiago Lucena on 16/06/19.
//  Copyright © 2019 Thiago Lucena. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func roundButton() {
//        self.layer.cornerRadius = self.bounds.size.height/2
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    func addBorder(ofWidth width: Float, andColor color: UIColor) {
        let borderFloat = CGFloat(width)
        self.layer.borderWidth = borderFloat
        self.layer.borderColor = color.cgColor
    }
    
    func addBorder(ofWidth width: Float) {
        let borderFloat = CGFloat(width)
        self.layer.borderWidth = borderFloat
    }
}

extension UIView {
    func roundView(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
