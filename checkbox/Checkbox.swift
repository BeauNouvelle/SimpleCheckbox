//
//  Checkbox.swift
//  CheckboxDemo
//
//  Created by Beau Nouvelle on 5/8/17.
//  Copyright © 2017 Beau Nouvelle. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class Checkbox: UIControl {

    public enum CheckmarkStyle {
        case square
        case circle
    }

    public enum BorderShape: Int {
        case square
        case circle
    }

    // MARK: - Properties
    public var checkmarkStyle: CheckmarkStyle = .square
    public var borderShape: BorderShape = .square

    @IBInspectable public var borderWidth: CGFloat = 2
    @IBInspectable public var checkmarkWidth: CGFloat = 0.5

    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var centerColor: UIColor = UIColor.black

    @IBInspectable var isChecked: Bool = false {
        didSet { setNeedsDisplay() }
    }

    override public func draw(_ rect: CGRect) {
        drawBorder(shape: borderShape, in: rect)
        if isChecked {
            drawCheckmark(style: checkmarkStyle, in: rect)
        }
    }

    // MARK: - Borders
    private func drawBorder(shape: BorderShape, in rect: CGRect) {
        switch shape {
        case .circle:
            circleBorder(rect: rect)
        case .square:
            squareBorder(rect: rect)
        }
    }

    private func squareBorder(rect: CGRect) {
        let rectanglePath = UIBezierPath(rect: rect)
        borderColor.setStroke()
        rectanglePath.lineWidth = borderWidth
        rectanglePath.stroke()
    }

    private func circleBorder(rect: CGRect) {
        let adjustedRect = CGRect(x: borderWidth/2,
                                  y: borderWidth/2,
                                  width: rect.width-borderWidth,
                                  height: rect.height-borderWidth)

        let ovalPath = UIBezierPath(ovalIn: adjustedRect)
        borderColor.setStroke()
        ovalPath.lineWidth = borderWidth
        ovalPath.stroke()
    }

    // MARK: - Checkmarks
    private func drawCheckmark(style: CheckmarkStyle, in rect: CGRect) {
        switch checkmarkStyle {
        case .square:
            squareCheckmark(rect: rect)
        case .circle:
            circleCheckmark(rect: rect)
        }
    }

    private func circleCheckmark(rect: CGRect) {
        let ovalPath = UIBezierPath(ovalIn: checkmarkRect(in: rect))
        centerColor.setFill()
        ovalPath.fill()
    }

    private func squareCheckmark(rect: CGRect) {
        let path = UIBezierPath(rect: checkmarkRect(in: rect))
        centerColor.setFill()
        path.fill()
    }

    // MARK: - Size Calculations
    private func checkmarkRect(in rect: CGRect) -> CGRect {
        let width = rect.maxX * checkmarkWidth
        let height = rect.maxY * checkmarkWidth
        let adjustedRect = CGRect(x: (rect.maxX - width) / 2,
                                  y: (rect.maxY - height) / 2,
                                  width: width,
                                  height: height)
        return adjustedRect
    }

}
