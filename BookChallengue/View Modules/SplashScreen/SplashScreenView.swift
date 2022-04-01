//
//  SplashScreenConstants.swift
//  BookChallengue
//
//  Created by Jonathan Avila on 10/03/22.
//
//
//  CupheadView.swift
//  UIBezierPathLesson
//
//  Created by Alexander Nikolaychuk on 12.06.2020.
//  Copyright © 2020 AlexAlmostEngineer. All rights reserved.
//
import UIKit


class SplashScreenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let head = getHeadShape()
        self.layer.addSublayer(head)
    }
    
    private func getHeadShape() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 84, y: 196))
        path.addQuadCurve(to: CGPoint(x: 366, y: 100), controlPoint: CGPoint(x: 205, y: 100))
        path.addCurve(to: CGPoint(x: 84, y: 196),
                      controlPoint1: CGPoint(x: 500, y: 330),
                      controlPoint2: CGPoint(x: 120, y: 430))
        path.close()
        let headShape = CAShapeLayer()
        headShape.path = path.cgPath
        headShape.lineWidth = 5
        headShape.strokeColor = UIColor.black.cgColor
        headShape.fillColor =  UIColor.clear.cgColor
        return headShape
    }
    
    
}
