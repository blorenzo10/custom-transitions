//
//  FontManager.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 2/4/21.
//

import UIKit

extension UIFont {
    
    enum FontType: String {
        case light = "Rubik-Light"
        case regular = "Rubik-Regular"
        case medium = "Rubik-Medium"
        case bold = "Rubik-Bold"
    }
    
    static func rubikFont(type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
    
    static let titleFont: UIFont = {
        return .rubikFont(type: .bold, size: 36)
    }()
    
    static let albumCoverTitleFont: UIFont = {
        return .rubikFont(type: .bold, size: 24)
    }()
    
    static let albumCoverSubtitleFont: UIFont = {
        return .rubikFont(type: .medium, size: 18)
    }()
    
    static let songTitleFont: UIFont = {
        return .rubikFont(type: .regular, size: 18)
    }()
    
    static let regularFont: UIFont = {
        return .rubikFont(type: .regular, size: 14)
    }()
}
