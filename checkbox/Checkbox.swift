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

    public enum BorderShape: Int {
        case square
        case circle
    }

    // MARK: - Properties
    public var checkmarkStyle: CheckmarkStyle = .square
    public var borderShape: BorderShape = .square

    public var borderWidth: CGFloat = 2
    public var checkmarkWidth: CGFloat = 0.5

    public var borderColor: UIColor = UIColor.black
    public var centerColor: UIColor = UIColor.black

    public var valueChanged: ((_ isChecked: Bool) -> Void)?

    public var isChecked: Bool = false {
        didSet { setNeedsDisplay() }
    }

    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        addGestureRecognizer(tapGesture)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        addGestureRecognizer(tapGesture)
    }

    // MARK: - DrawRect
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

    // MARK: - Events
    @objc private func handleTapGesture(recognizer: UITapGestureRecognizer) {
        isChecked = !isChecked
        valueChanged?(isChecked)
        sendActions(for: .valueChanged)
    }

}
