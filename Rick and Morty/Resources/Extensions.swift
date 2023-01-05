//
//  Extensions.swift
//  Rick and Morty
//
//  Created by My Air on 05.01.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}


