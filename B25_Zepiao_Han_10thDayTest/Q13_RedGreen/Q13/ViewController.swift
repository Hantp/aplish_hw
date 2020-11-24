//
//  ViewController.swift
//  Q13
//
//  Created by Zepiao Han on 11/24/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func toRed(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.systemRed
    }
    
    
    @IBAction func toGreen(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.systemGreen
    }
    
}

