//
//  File.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/13.
//

import UIKit

class PaddingLabel: UILabel {

    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)

    override func drawText(in rect: CGRect) {
        let newRect = rect.inset(by: padding)
        super.drawText(in: newRect)
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }

}
