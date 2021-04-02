//
//  UILabel+Factory.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 2/4/21.
//

import UIKit

extension UILabel {
    enum AlbumCoverLabelType {
        case title
        case subtitle
        case regular
    }
    
    static func albumCoverLabel(type: AlbumCoverLabelType) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        
        switch type {
        case .title:
            label.font = .albumCoverTitleFont
            label.textColor = .white
            
        case .subtitle:
            label.font = .albumCoverSubtitleFont
            label.textColor = .black
            
        case .regular:
            label.font = .regularFont
            label.textColor = .textForegroundColor
        }
        
        return label
    }
}
