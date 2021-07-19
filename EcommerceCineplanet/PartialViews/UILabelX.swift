//
//  UILabelX.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation
import UIKit


@IBDesignable
class UILabelX: UILabel {
   
    @IBInspectable var angle: CGFloat = 1.6
    @IBInspectable var clockwise: Bool = true
    
    override func draw(_ rect: CGRect) {
        centreArcPerpendicular()
    }
    
   
    func centreArcPerpendicular() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let str = self.text ?? ""
        let size = self.bounds.size
        context.translateBy(x: size.width / 2, y: size.height / 2)
        
        let radius = getRadiusForLabel()
        let l = str.count
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: self.font]
        
        let characters: [String] = str.map { String($0) }
        var arcs: [CGFloat] = []
        var totalArc: CGFloat = 0
        
        for i in 0 ..< l {
            arcs += [chordToArc(characters[i].size(withAttributes: attributes).width, radius: radius)]
            totalArc += arcs[i]
        }
        
        
        let direction: CGFloat = clockwise ? -1 : 1
        let slantCorrection = clockwise ? -CGFloat(M_PI_2) : CGFloat(M_PI_2)
        
       
        var thetaI = angle - direction * totalArc / 2
        
        for i in 0 ..< l {
            thetaI += direction * arcs[i] / 2
           
            centre(text: characters[i], context: context, radius: radius, angle: thetaI, slantAngle: thetaI + slantCorrection)
           
            thetaI += direction * arcs[i] / 2
        }
    }
    
    func chordToArc(_ chord: CGFloat, radius: CGFloat) -> CGFloat {
       
        return 2 * asin(chord / (2 * radius))
    }
  
    func centre(text str: String, context: CGContext, radius r:CGFloat, angle theta: CGFloat, slantAngle: CGFloat) {
        let attributes = [NSAttributedString.Key.foregroundColor: self.textColor,
                          NSAttributedString.Key.font: self.font] as [NSAttributedString.Key : Any]
        context.saveGState()
        context.translateBy(x: r * cos(theta), y: -(r * sin(theta)))
        context.rotate(by: -slantAngle)
        let offset = str.size(withAttributes: attributes)
        context.translateBy(x: -offset.width / 2, y: -offset.height / 2)
        str.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        context.restoreGState()
    }
    
    func getRadiusForLabel() -> CGFloat {
       
        let smallestWidthOrHeight = min(self.bounds.size.height, self.bounds.size.width)
        let heightOfFont = self.text?.size(withAttributes: [NSAttributedString.Key.font: self.font]).height ?? 0
        
        return (smallestWidthOrHeight/2) - heightOfFont + 5
    }
}
