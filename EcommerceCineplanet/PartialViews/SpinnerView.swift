//
//  SpinnerView.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
import UIKit

public class SpinnerView: UIView {

  let shape = CAShapeLayer()
  let gradientLayer = CAGradientLayer()
  var gradientColors: [CGColor] = []

  convenience public init(frame: CGRect, strokeStart: CGFloat,
                          strokeEnd: CGFloat, gradientColors: [CGColor]) {
    self.init(frame: frame)
    backgroundColor = .clear
    shape.strokeColor = UIColor.black.cgColor
    shape.backgroundColor = UIColor.clear.cgColor
    shape.fillColor = nil
    shape.lineWidth = 6
    shape.strokeEnd = strokeEnd
    shape.strokeStart = strokeStart
    self.gradientColors = gradientColors
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    shape.frame = self.bounds
    setPath()
    setGradient()
  }

  private func setPath() {
    shape.path = UIBezierPath(ovalIn: bounds.insetBy(dx: shape.lineWidth / 2,
                                                     dy: shape.lineWidth / 2)).cgPath
    shape.lineCap = CAShapeLayerLineCap.round
  }

  private func setGradient() {
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.frame = self.layer.bounds
    gradientLayer.colors = gradientColors
    gradientLayer.mask = shape
    layer.addSublayer(gradientLayer)
  }
  
}
