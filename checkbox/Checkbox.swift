//
//  Checkbox.swift
//  CheckboxDemo
//
//  Created by Beau Nouvelle on 5/8/17.
//  Copyright © 2017 Beau Nouvelle. All rights reserved.
//

import Foundation
import UIKit

public class Checkbox: UIControl {

    // MARK: - Enums
    public enum CheckmarkStyle {
        case square
        case circle
    }

    public enum BorderStyle: Int {
        case square
        case circle
    }

    // MARK: - Properties
    public var checkmarkStyle: CheckmarkStyle = .square
    public var borderStyle: BorderStyle = .square

    public var borderWidth: CGFloat = 2
    public var checkmarkWidth: CGFloat = 0.5

    public var borderColor: UIColor = UIColor.black
    public var checkmarkColor: UIColor = UIColor.black

    public var increasedTouchRadius: CGFloat = 5

    public var valueChanged: ((_ isChecked: Bool) -> Void)?

    public var isChecked: Bool = false {
        didSet { setNeedsDisplay() }
    }

    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        addGestureRecognizer(tapGesture)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        addGestureRecognizer(tapGesture)
    }

    // MARK: - DrawRect
    override public func draw(_ rect: CGRect) {
        drawBorder(shape: borderStyle, in: rect)
        if isChecked {
            drawCheckmark(style: checkmarkStyle, in: rect)
        }
    }

    // MARK: - Borders
    private func drawBorder(shape: BorderStyle, in rect: CGRect) {
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
        rectanglePath.lineWidth = borderWidth * 2
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
        checkmarkColor.setFill()
        ovalPath.fill()
    }

    private func squareCheckmark(rect: CGRect) {
        let path = UIBezierPath(rect: checkmarkRect(in: rect))
        checkmarkColor.setFill()
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

    // MARK: - Touch
    @objc private func handleTapGesture(recognizer: UITapGestureRecognizer) {
        isChecked = !isChecked
        valueChanged?(isChecked)
        sendActions(for: .valueChanged)
    }

    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsetsMake(-increasedTouchRadius,
                                                 -increasedTouchRadius,
                                                 -increasedTouchRadius,
                                                 -increasedTouchRadius)
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, hitTestEdgeInsets)
        return hitFrame.contains(point)
    }

}
