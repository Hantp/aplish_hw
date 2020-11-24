//
//  MoreInfo.swift
//  Q16
//
//  Created by Zepiao Han on 11/24/20.
//

import UIKit

class MoreInfo: UIViewController {

    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let c = car {
            name.text = c.name
            maker.text = c.maker
            info.text = c.briefInfo
            carimage.image = UIImage(named: c.imageName)
        }
    }
    
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var maker: UILabel!
    
    @IBOutlet var info: UILabel!
    
    @IBOutlet var carimage: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
