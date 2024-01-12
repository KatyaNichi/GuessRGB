//
//  RGB.swift
//  GuessRGB
//
//  Created by Ekaterina Nichiporenko on 2023-12-24.
//

import Foundation

struct RGB {
    var red = 0.3
    var green = 0.5
    var blue = 0.7
    
  
    static func random() -> RGB {
        var rgb = RGB()
        rgb.red = Double.random(in: 0..<1)
        rgb.green = Double.random(in: 0..<1)
        rgb.blue = Double.random(in: 0..<1)
        return rgb
    }
    func difference(target: RGB) -> Double {
        let redDiff = red - target.red
        let greenDiff = green - target.green
        let blueDiff = blue - target.blue
        return sqrt(
          (redDiff * redDiff + greenDiff * greenDiff + blueDiff * blueDiff) / 3.0)
      }

      func intString() -> String {
        "R: \(Int(red * 255.0))"
          + "  G: \(Int(green * 255.0))"
          + "  B: \(Int(blue * 255.0))"
      }
}
