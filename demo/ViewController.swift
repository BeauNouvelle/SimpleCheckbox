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
        circleBox.borderWidth = 1
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
        squareBox.borderWidth = 1
        squareBox.valueChanged = { (value) in
            print("square checkbox value change: \(value)")
        }
        view.addSubview(squareBox)

        // cross
        let crossBox = Checkbox(frame: CGRect(x: 30, y: 120, width: 25, height: 25))
        crossBox.borderStyle = .square
        crossBox.checkmarkStyle = .cross
        crossBox.checkmarkSize = 0.7
        view.addSubview(crossBox)

        // tick
        let tickBox = Checkbox(frame: CGRect(x: 30, y: 160, width: 25, height: 25))
        tickBox.borderStyle = .square
        tickBox.checkmarkStyle = .tick
        tickBox.checkmarkSize = 0.7
        view.addSubview(tickBox)
    }

    // target action example
    @objc func circleBoxValueChanged(sender: Checkbox) {
        print("circle box value change: \(sender.isChecked)")
    }

}
