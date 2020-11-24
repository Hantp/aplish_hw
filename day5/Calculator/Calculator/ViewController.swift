//
//  ViewController.swift
//  Calculator
//
//  Created by Zepiao Han on 11/17/20.
//

import UIKit

enum MathOperation {
    case add
    case minus
    case divide
    case times
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pad.text = "0"
        pad.textColor = UIColor.white
        lastValue.text = "stored value: "
        lastValue.textColor = UIColor.white
    }
    
    
    private var decimalBase: Double? = nil
    private var isMinus: Bool = false
    private var beforeDotNum: Int = 0
    private var beforeDotString: String = ""
    private var decimalNum: Double = 0
    private var decimalString: String = ""
    private var storedResult: Double? = nil
    private var operation: MathOperation? = nil

    @IBOutlet var pad: UILabel!
    
    @IBOutlet var lastValue: UILabel!
    
    @IBAction func clearBtn(_ sender: UIButton) {
        storedResult = nil
        beforeDotNum = 0
        beforeDotString = ""
        decimalNum = 0
        decimalString = ""
        isMinus = false
        decimalBase = nil
        operation = nil
        pad.text = "0"
    }
    
    @IBAction func signBtn(_ sender: UIButton) {
        isMinus = !isMinus
        
        updatePadText()
    }
    
    @IBAction func pointBtn(_ sender: UIButton) {
        if decimalBase == nil {
            decimalBase = 0.1
            updatePadText()
        }
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        let middle = beforeDotNum % 100
        beforeDotNum = beforeDotNum / 100
        beforeDotString = String(beforeDotNum)
        
        if middle < 10 {
            decimalString = "0" + String(middle) + decimalString
        } else {
            decimalString = String(middle) + decimalString
        }
        
        decimalNum = (Double(middle) + decimalNum) * 0.01
        
        if let db = decimalBase {
            decimalBase = db * 0.001
        } else {
            decimalBase = 0.001
        }
        
        updatePadText()
    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        if storedResult == nil {
            storedResult = getCurrentNumber()
            lastValue.text = "stored value: " + String(storedResult!)
            clearCurrentNumber()
            updatePadText()
        } else {
            updateResult()
        }
        self.operation = .divide
    }
    
    @IBAction func timesBtn(_ sender: UIButton) {
        if storedResult == nil {
            storedResult = getCurrentNumber()
            lastValue.text = "stored value: " + String(storedResult!)
            clearCurrentNumber()
            updatePadText()
        } else {
            updateResult()
        }
        self.operation = .times
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        if storedResult == nil {
            storedResult = getCurrentNumber()
            lastValue.text = "stored value: " + String(storedResult!)
            clearCurrentNumber()
            updatePadText()
        } else {
            updateResult()
        }
        self.operation = .minus
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        if storedResult == nil {
            storedResult = getCurrentNumber()
            lastValue.text = "stored value: " + String(storedResult!)
            clearCurrentNumber()
            updatePadText()
        } else {
            updateResult()
        }
        
        self.operation = .add
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        updateResult()
    }
    
    func updateResult() {
        if let sR = storedResult {
            let currentNumber = getCurrentNumber()
            clearCurrentNumber()
            
            switch operation {
            case .add:
                storedResult = sR + currentNumber
            case .minus:
                storedResult = sR - currentNumber
            case .times:
                storedResult = sR * currentNumber
            default:
                if currentNumber != 0 {
                    storedResult = sR / currentNumber
                } else {
                    storedResult = nil
                }
            }
            
            if storedResult == nil {
                pad.text = "error"
            } else {
                pad.text = String(storedResult!)
                lastValue.text = "stored value: " + String(storedResult!)
            }
        }
    }
    
    func getCurrentNumber() -> Double {
        var currentNumber = Double(beforeDotNum)
        if decimalBase != nil {
            currentNumber += decimalNum
        }
        if isMinus {
            currentNumber = -currentNumber
        }
        
        return currentNumber
    }
    
    func clearCurrentNumber() {
        beforeDotNum = 0
        beforeDotString = ""
        decimalNum = 0
        decimalBase = nil
        decimalString = ""
        isMinus = false
    }
    
    func updatePadText() {
        var minusSign = ""
        if isMinus {
            minusSign = "-"
        }
        
        if decimalBase != nil {
            pad.text = minusSign + beforeDotString + "." + decimalString
        } else {
            pad.text = minusSign + beforeDotString
        }
    }
    
    func appendNumber(_ num: Int) {
        if decimalBase != nil {
            decimalNum += decimalBase! * Double(num)
            decimalBase! *= 0.1
            decimalString += String(num)
        } else {
            beforeDotNum = beforeDotNum * 10 + num
            beforeDotString += String(num)
        }
        
        updatePadText()
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        appendNumber(7)
    }
    
    @IBAction func eightBtn(_ sender: UIButton) {
        appendNumber(8)
    }
    
    @IBAction func nineBtn(_ sender: UIButton) {
        appendNumber(9)
    }
    
    @IBAction func fourBtn(_ sender: UIButton) {
        appendNumber(4)
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        appendNumber(5)
    }
    
    @IBAction func sixBtn(_ sender: UIButton) {
        appendNumber(6)
    }
    
    @IBAction func oneBtn(_ sender: UIButton) {
        appendNumber(1)
    }
    
    @IBAction func twoBtn(_ sender: UIButton) {
        appendNumber(2)
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        appendNumber(3)
    }
    
    @IBAction func zeroBtn(_ sender: UIButton) {
        appendNumber(0)
    }
}

