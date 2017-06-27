//
//  ExtraCommandButton.swift
//  CalcExample
//
//  Created by Admin on 2016-07-20.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

/// UIButton subclass that draws a rounded rectangle in its background.

open class ExtraCommandButton: UIButton {

    // MARK: Public interface
    
    /// Color of the background rectangle
    open var rectColor: UIColor = UIColor(red:0.79, green:0.79, blue:0.80, alpha:1.0) {
        didSet {
            self.setNeedsLayout()
        }
    }
    /// Color of the title text
    open var titleTextColor: UIColor = UIColor(red:0.41, green:0.41, blue:0.42, alpha:1.0);
    
    // MARK: Overrides
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        layoutRoundRectLayer()
        setTitleColor(titleTextColor, for: UIControlState() )
    }
    
    // MARK: Private
    
    fileprivate var roundRectLayer: CAShapeLayer?
    
    fileprivate func layoutRoundRectLayer() {
        if let existingLayer = roundRectLayer {
            existingLayer.removeFromSuperlayer()
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(rect: self.bounds).cgPath
        shapeLayer.fillColor = rectColor.cgColor
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.roundRectLayer = shapeLayer
    }
}
