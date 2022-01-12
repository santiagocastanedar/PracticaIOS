//
//  ThemeProtocol.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 11/01/22.
//

import UIKit

protocol ThemeProtocol {
    var mainFontName: String { get }
    var textColor: UIColor { get }
    var accent: UIColor { get }
    var background: UIColor { get }
    var tint: UIColor { get }
}
