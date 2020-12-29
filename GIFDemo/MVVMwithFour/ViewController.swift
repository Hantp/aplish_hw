//
//  ViewController.swift
//  MVVMwithFour
//
//  Created by Zepiao Han on 12/15/20.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemTeal
        setGIF()
    }
    
    func setGIF() {
        let imgView = SDAnimatedImageView()
        
        // show the local gif
//        imgView.image = SDAnimatedImage(named: "giphy.gif")
        
        // show the gif online
        let url = URL(string: "https://media3.giphy.com/media/adgCiRnUV6EWVY8Brp/giphy.gif?cid=ecf05e4732c34526811d3b18acb3514480011d68330e0206&rid=giphy.gif")
        let imageData = try? Data(contentsOf: url!)
        print(imageData!)
        imgView.image = SDAnimatedImage(data: imageData!)
        
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imgView)
        imgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
    }
}

