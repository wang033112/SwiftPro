//
//  ScrollImageView.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/02/07.
//

import UIKit

class ScrollImageView: UIScrollView {
    var itemWidth: CGFloat = UIScreen.main.bounds.width
    var itemHeight = 300
    
    init(_ frame: CGRect, images: [String]) {
        super.init(frame: frame)
        isPagingEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        contentSize = CGSize(width: (Int)(itemWidth) * images.count, height: 0)
        
        for (index, imageURL) in images.enumerated() {
            let image = UIImageView(image: UIImage(named: imageURL))
            image.frame = CGRect(x: index * Int(itemWidth), y: 0, width: Int(itemWidth), height: itemHeight)
            addSubview(image)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
