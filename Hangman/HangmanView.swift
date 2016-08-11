//
//  HangmanView.swift
//  Hangman
//
//  Created by Alex Banh on 8/8/16.
//  Copyright © 2016 Flybu. All rights reserved.
//

import UIKit

@IBDesignable

class HangmanView: UIView {
    
    @IBInspectable var wrongs: Int = 0 {
        didSet {
            if wrongs <= 6 {
                setNeedsDisplay()
            }
        }
    }
        
    var scale: CGFloat = 1.00
    
    var relWidth: CGFloat {
        return (bounds.width/8) * scale
    }
    
    var relHeight: CGFloat {
        return (bounds.height/8) * scale
    }
        
    var skullRadius: CGFloat {
        return relHeight / 2
    }
        
    var skullCenter: CGPoint {
        return CGPoint(x: relWidth * 6, y: (relHeight * 3) + skullRadius)
    }
    
    private func pathForGallows() -> UIBezierPath {
        let gallowPath = UIBezierPath()
        gallowPath.moveToPoint(CGPoint(x:relWidth,y:(relHeight)*7))
        gallowPath.addLineToPoint(CGPoint(x:(relWidth)*5, y:(relHeight)*7))
        gallowPath.moveToPoint(CGPoint(x:(relWidth)*3, y:(relHeight)*7))
        gallowPath.addLineToPoint(CGPoint(x:(relWidth)*3, y:(relHeight)*2))
        gallowPath.addLineToPoint(CGPoint(x:(relWidth)*6, y:(relHeight)*2))
        gallowPath.addLineToPoint(CGPoint(x:(relWidth)*6, y:(relHeight)*3))
        gallowPath.lineWidth = 5.0
        return gallowPath
    }
    
    private func pathForHead() -> UIBezierPath {
        let headPath = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        return headPath
    }
    
    private func pathForBody() -> UIBezierPath {
        let bodyPath = UIBezierPath()
        bodyPath.moveToPoint(CGPoint(x: relWidth * 6, y: relHeight * 4))
        bodyPath.addLineToPoint(CGPoint(x: relWidth * 6, y: relHeight * 5 + relHeight / 2))
        return bodyPath
    }
    
    private func pathForLeg(x_value: CGFloat) -> UIBezierPath {
        let legPath = UIBezierPath()
        legPath.moveToPoint(CGPoint(x: relWidth * 6, y: relHeight * 5.5))
        legPath.addLineToPoint(CGPoint(x: relWidth * x_value, y: relHeight * 6.5))
        return legPath
    }
    
    private func pathForArm(x_value: CGFloat) -> UIBezierPath {
        let armPath = UIBezierPath()
        armPath.moveToPoint(CGPoint(x: relWidth * 6, y: relHeight * 4.5))
        armPath.addLineToPoint(CGPoint(x: relWidth * x_value, y: relHeight * 4))
        return armPath
    }

    override func drawRect(rect: CGRect) {
        pathForGallows().stroke()
        if (wrongs >= 1) {
            pathForHead().stroke()
        }
        if (wrongs >= 2) {
            pathForBody().stroke()
        }
        if (wrongs >= 3) {
            pathForLeg(5).stroke()
        }
        if (wrongs >= 4) {
            pathForLeg(7).stroke()
        }
        if (wrongs >= 5) {
            pathForArm(4.5).stroke()
        }
        if (wrongs >= 6) {
            pathForArm(7.5).stroke()
        }
    }


}
