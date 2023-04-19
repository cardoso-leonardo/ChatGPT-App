//
//  Extensions.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 19/04/23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for v in views {
            addSubview(v)
        }
    }
}
