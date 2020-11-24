//
//  ViewController.swift
//  Q12
//
//  Created by Zepiao Han on 11/24/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushBtn(_ sender: UIButton) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(identifier: "ViewController1")
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func presentBtn(_ sender: UIButton) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(identifier: "ViewController2")
        
        present(vc, animated: true, completion: nil)
    }
    
}

