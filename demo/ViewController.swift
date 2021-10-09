//
//  ViewController.swift
//  Checkbox
//
//  Created by Beau Nouvelle on 5/8/17.
//  Copyright © 2017 Beau Nouvelle. All rights reserved.
//

import UIKit
import SimpleCheckbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addCheckboxSubviews()
    }

    func addCheckboxSubviews() {
        // circle
        let circleBox = Checkbox(frame: CGRect(x: 30, y: 40, width: 25, height: 25))
        circleBox.borderStyle = .circle
        circleBox.checkmarkStyle = .circle
        circleBox.borderLineWidth = 1
        circleBox.uncheckedBorderColor = .lightGray
        circleBox.checkedBorderColor = .blue
        circleBox.checkmarkSize = 0.8
        circleBox.checkmarkColor = .blue
        circleBox.addTarget(self, action: #selector(circleBoxValueChanged(sender:)), for: .valueChanged)
        view.addSubview(circleBox)

        // square
        let squareBox = Checkbox(frame: CGRect(x: 30, y: 80, width: 25, height: 25))
        squareBox.tintColor = .black
        squareBox.borderStyle = .square
        squareBox.checkmarkStyle = .square
        squareBox.uncheckedBorderColor = .lightGray
        squareBox.borderLineWidth = 1
        squareBox.valueChanged = { (value) in
            print("squarebox value change: \(value)")
        }
        view.addSubview(squareBox)

        // cross
        let crossBox = Checkbox(frame: CGRect(x: 30, y: 120, width: 25, height: 25))
        crossBox.borderStyle = .square
        crossBox.checkmarkStyle = .cross
        crossBox.checkmarkSize = 0.7
        crossBox.borderCornerRadius = 5
        crossBox.valueChanged = { (value) in
            print("crossBox value change: \(value)")
        }
        view.addSubview(crossBox)

        // tick
        let tickBox = Checkbox(frame: CGRect(x: 30, y: 160, width: 25, height: 25))
        tickBox.borderStyle = .square
        tickBox.checkmarkStyle = .tick
        tickBox.checkmarkSize = 0.7
        tickBox.valueChanged = { (value) in
            print("tickBox value change: \(value)")
        }
        view.addSubview(tickBox)

        // Emoji
        let emojiBox = Checkbox(frame: CGRect(x: 30, y: 160, width: 25, height: 25))
        emojiBox.borderStyle = .square
        emojiBox.emoji = "🥰"
        emojiBox.checkmarkSize = 0.7
        emojiBox.valueChanged = { (value) in
            print("emojiBox value change: \(value)")
        }
        view.addSubview(emojiBox)
    }

    // target action example
    @objc func circleBoxValueChanged(sender: Checkbox) {
        print("circleBox value change: \(sender.isChecked)")
    }

}
