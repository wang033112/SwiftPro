//
//  TabBarView.swift
//  SwiftPro
//
//  Created by Wang Jie on 2021/01/23.
//

import UIKit

class TabBarView: UITabBar {

    var width: CGFloat;
    var height: CGFloat;
    private var r: CGFloat = 40
    private var corner: CGFloat = 20
    private var shapeLayer: CALayer?
    
    override init(frame: CGRect) {
        width = frame.width
        height = frame.height
        super.init(frame: frame)
        //self.backgroundColor = .blue
        
        let layer = createLayer()
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: layer)
        } else {
            self.layer.insertSublayer(layer, at: 0)
        }
        self.shapeLayer = layer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .gray
    }
    
    private func createLayer() -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.cornerRadius = 5
        //layer.strokeColor = UIColor.gray.cgColor
        layer.fillColor = UIColor.white.cgColor
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: width / 2  - r - corner, y: 0))
        
        path.addCurve(to: CGPoint(x: width / 2 , y: -20), controlPoint1: CGPoint(x: width / 2 - r + corner / 2 , y: 0),
                      controlPoint2: CGPoint(x: width / 2 - r + corner / 2, y: -20))
        
        path.addCurve(to: CGPoint(x: width / 2 + r + corner, y: 0), controlPoint1: CGPoint(x: width / 2 + r - corner / 2, y: -20),
                      controlPoint2: CGPoint(x: width / 2 + r - corner / 2, y: 0))
        
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        
        layer.path = path.cgPath
        return layer
        
    }
}
