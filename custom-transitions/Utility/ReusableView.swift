//
//  ReusableView.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 2/4/21.
//

import Foundation

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

public extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
