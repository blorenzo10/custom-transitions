//
//  UIButton+Factory.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 4/4/21.
//

import UIKit

extension UIButton {
    static func closeButton() -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        return button
    }
}
