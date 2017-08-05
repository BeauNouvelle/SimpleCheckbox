//
//  ViewController.swift
//  Checkbox
//
//  Created by Beau Nouvelle on 5/8/17.
//  Copyright © 2017 Beau Nouvelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addCheckboxSubviews()
    }

    func addCheckboxSubviews() {
        // round box
        let circleBox = Checkbox(frame: CGRect(x: 50, y: 50, width: 25, height: 25))
        circleBox.borderStyle = .circle
        circleBox.checkmarkStyle = .circle
        circleBox.borderWidth = 1
        circleBox.borderColor = .blue
        circleBox.checkmarkSize = 0.8
        circleBox.checkmarkColor = .blue
        circleBox.addTarget(self, action: #selector(circleBoxValueChanged(sender:)), for: .valueChanged)
        view.addSubview(circleBox)

        // square box
        let squareBox = Checkbox(frame: CGRect(x: 50, y: 110, width: 25, height: 25))
        squareBox.borderStyle = .square
        squareBox.checkmarkStyle = .square
        squareBox.borderWidth = 1

        // Closure example
        squareBox.valueChanged = { (value) in
            print("square checkbox value change: \(value)")
        }
        view.addSubview(squareBox)
    }

    // target action example
    @objc func circleBoxValueChanged(sender: Checkbox) {
        print("circle box value change: \(sender.isChecked)")
    }

}
