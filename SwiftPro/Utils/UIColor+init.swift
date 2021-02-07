//
//  UIColor+init.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/07.
//
import UIKit

extension UIColor {
    
    // 500 #F9AA33
    // 600 #4A6572
    // 700 #344955
    // 800 #232F34
    convenience init(code: String) {
        var color: UInt64 = 0
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
        if Scanner(string: code.replacingOccurrences(of: "#", with: "")).scanHexInt64(&color) {
            r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            g = CGFloat((color & 0x00FF00) >>  8) / 255.0
            b = CGFloat( color & 0x0000FF       ) / 255.0
        }
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
