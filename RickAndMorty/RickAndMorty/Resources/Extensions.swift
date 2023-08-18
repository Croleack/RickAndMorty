//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

