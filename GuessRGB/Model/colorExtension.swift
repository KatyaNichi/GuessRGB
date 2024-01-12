//
//  colorExtension.swift
//  GuessRGB
//
//  Created by Ekaterina Nichiporenko on 2023-12-26.
//

import Foundation
import SwiftUI

extension Color {
    init(rgbStruct rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
}
