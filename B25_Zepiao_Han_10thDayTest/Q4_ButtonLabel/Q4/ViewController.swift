//
//  ViewController.swift
//  Q4
//
//  Created by Zepiao Han on 11/24/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if label == nil {
            label = UILabel(frame: CGRect(x: 50, y: 250, width: 500, height: 100))
        }
        label?.isHidden = true
        label?.text = String(counter)
        
        let btn = UIButton(frame: CGRect(x: 10, y: 500, width: 100, height: 100))
        btn.setTitle("show label", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(add), for: .touchUpInside)
        
        self.view.addSubview(label!)
        self.view.addSubview(btn)
    }

    var label: UILabel?
    private var counter: Int = 0
    
    @objc func add() {
        counter += 1
        label?.isHidden = false
        label?.text = String(counter)
    }

}

