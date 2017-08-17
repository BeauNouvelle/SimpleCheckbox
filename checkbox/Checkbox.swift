//
//  Checkbox.swift
//  CheckboxDemo
//

import Foundation
import UIKit

/// Checkbox is a simple, animation free checkbox and UISwitch alternative designed
/// to be performant and easy to implement.
public class Checkbox: UIControl {

    // MARK: - Enums

    /// Shape of the center checkmark that appears when `Checkbox.isChecked == true`.
    public enum CheckmarkStyle {
        /// ■
        case square
        /// ●
        case circle
        /// ╳
        case cross
        /// ✓
        case tick
    }

    /// Shape of the outside box containing the checkmarks contents.
    ///
    /// Used as a visual indication of where the user can tap.
    public enum BorderStyle {
        /// ▢
        case square
        /// ◯
        case circle
    }

    // MARK: - Properties

    /// Shape of the center checkmark that appears when `Checkbox.isChecked == true`.
    ///
    /// **Default:** `CheckmarkStyle.square`
    public var checkmarkStyle: CheckmarkStyle = .square

    /// Shape of the outside border containing the checkmarks contents.
    ///
    /// Used as a visual indication of where the user can tap.
    ///
    /// **Default:** `BorderStyle.square`
    public var borderStyle: BorderStyle = .square

    /// Width of the borders stroke.
    ///
    /// **NOTE**
    ///
    /// Diagonal/rounded lines tend to appear thicker, so border styles
    /// that use these (.circle) have had their border widths halved to compensate
    /// in order appear similar next to other border styles.
    ///
    /// **Default:** `2`
    public var borderWidth: CGFloat = 2

    /// Size of the center checkmark element.
    ///
    /// Drawn as a percentage of the size of the Checkbox's draw rect.
    ///
    /// **Default:** `0.5`
    public var checkmarkSize: CGFloat = 0.5

    /// **Default:** The current tintColor.
    public var borderColor: UIColor!

    /// **Default:** The current tintColor.
    public var checkmarkColor: UIColor!

    /// Increases the controls touch area.
    ///
    /// Checkbox's tend to be smaller than regular UIButton elements
    /// and in some cases making them difficult to interact with.
    /// This property helps with that.
    ///
    /// **Default:** `5`
    public var increasedTouchRadius: CGFloat = 5

    /// A function can be passed in here and will be called
    /// when the `isChecked` value changes due to a tap gesture
    /// triggered by the user.
    ///
    /// An alternative to use the TargetAction method.
    public var valueChanged: ((_ isChecked: Bool) -> Void)?

    /// Indicates whether the checkbox is currently in a state of being
    /// checked or not.
    public var isChecked: Bool = false {
        didSet { setNeedsDisplay() }
    }

    // MARK: - Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefaults()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDefaults()
    }

    private func setupDefaults() {
        backgroundColor = .white
        borderColor = tintColor
        checkmarkColor = tintColor

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        addGestureRecognizer(tapGesture)
    }

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
        ovalPath.lineWidth = borderWidth / 2
        ovalPath.stroke()
    }

    // MARK: - Checkmarks

    private func drawCheckmark(style: CheckmarkStyle, in rect: CGRect) {
        let adjustedRect = checkmarkRect(in: rect)
        switch checkmarkStyle {
        case .square:
            squareCheckmark(rect: adjustedRect)
        case .circle:
            circleCheckmark(rect: adjustedRect)
        case .cross:
            crossCheckmark(rect: adjustedRect)
        case .tick:
            tickCheckmark(rect: adjustedRect)
        }
    }

    private func circleCheckmark(rect: CGRect) {
        let ovalPath = UIBezierPath(ovalIn: rect)
        checkmarkColor.setFill()
        ovalPath.fill()
    }

    private func squareCheckmark(rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        checkmarkColor.setFill()
        path.fill()
    }

    private func crossCheckmark(rect: CGRect) {
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: rect.minX + 0.06250 * rect.width, y: rect.minY + 0.06452 * rect.height))
        bezier4Path.addLine(to: CGPoint(x: rect.minX + 0.93750 * rect.width, y: rect.minY + 0.93548 * rect.height))
        bezier4Path.move(to: CGPoint(x: rect.minX + 0.93750 * rect.width, y: rect.minY + 0.06452 * rect.height))
        bezier4Path.addLine(to: CGPoint(x: rect.minX + 0.06250 * rect.width, y: rect.minY + 0.93548 * rect.height))
        checkmarkColor.setStroke()
        bezier4Path.lineWidth = checkmarkSize * 2
        bezier4Path.stroke()
    }

    private func tickCheckmark(rect: CGRect) {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: rect.minX + 0.04688 * rect.width, y: rect.minY + 0.63548 * rect.height))
        bezierPath.addLine(to: CGPoint(x: rect.minX + 0.34896 * rect.width, y: rect.minY + 0.95161 * rect.height))
        bezierPath.addLine(to: CGPoint(x: rect.minX + 0.95312 * rect.width, y: rect.minY + 0.04839 * rect.height))
        checkmarkColor.setStroke()
        bezierPath.lineWidth = checkmarkSize * 2
        bezierPath.stroke()
    }

    // MARK: - Size Calculations

    private func checkmarkRect(in rect: CGRect) -> CGRect {
        let width = rect.maxX * checkmarkSize
        let height = rect.maxY * checkmarkSize
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
