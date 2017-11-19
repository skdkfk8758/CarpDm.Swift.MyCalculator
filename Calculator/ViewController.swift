//
//  ViewController.swift
//  Calculator
//
//  Created by 김동현 on 2017. 11. 18..
//  Copyright © 2017년 김동현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentInDisplay = display.text!
            display!.text = textCurrentInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var model = CalculatorModel()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            model.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathSymbol = sender.currentTitle {
            model.performOperation(symbol: mathSymbol)
        }
        displayValue = model.result
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        displayValue = 0
        model = CalculatorModel()
    }
}

