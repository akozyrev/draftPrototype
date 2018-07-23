//
//  Gradient.swift
//  draftPrototype
//
//  Created by Andrei Kozyrev on 7/23/18.
//  Copyright © 2018 Andrei Kozyrev. All rights reserved.
//

import UIKit

@IBDesignable // means we are designing new tools for our class
class Gradient: UIButton {

  let gradientLayer = CAGradientLayer()
  
  @IBInspectable
  var topGradientColor: UIColor? {
    didSet {
      setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
    }
  }
  
  @IBInspectable
  var bottomGradientColor: UIColor? {
    didSet {
      setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
    }
  }
  
  func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
    if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
      gradientLayer.frame = bounds
      gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
      layer.insertSublayer(gradientLayer, at: 0)
    } else {
      gradientLayer.removeFromSuperlayer()
    }
  }
  
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
