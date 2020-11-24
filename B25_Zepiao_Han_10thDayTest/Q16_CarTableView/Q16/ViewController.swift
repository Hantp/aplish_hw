//
//  ViewController.swift
//  Q16
//
//  Created by Zepiao Han on 11/24/20.
//

import UIKit

struct Car {
    var name: String
    var maker: String
    var briefInfo: String
    var imageName: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [Car] = []
    
    @IBOutlet var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let car1 = Car(name: "BMW", maker: "BMW maker", briefInfo: "bmw brief intro", imageName: "bmw_img")
        let car2 = Car(name: "Tesla", maker: "Tesla inc", briefInfo: "tesla brief intro", imageName: "tesla_img")
        data.append(car1)
        data.append(car2)
        
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let idx = indexPath.row
        cell?.textLabel?.text = data[idx].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = data[indexPath.row]
        let alert = UIAlertController(title: car.name, message: car.briefInfo, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OKl", style: .cancel, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "More Info?", style: .default, handler: { (_) in
            let story = UIStoryboard(name: "Main", bundle: nil)
            let vc = story.instantiateViewController(identifier: "MoreInfo") as! MoreInfo
            
            vc.car = car
            
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        
        present(alert, animated: true)
    }
}

