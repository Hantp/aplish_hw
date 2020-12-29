//
//  ViewController.swift
//  TablViewWIthMVVM
//
//  Created by Zepiao Han on 12/9/20.
//

import UIKit

class ViewController: UIViewController {

    var tblView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setTableView()
        tblView.delegate = self
        tblView.dataSource = self
    }

    private func setTableView() {
        view.addSubview(tblView)
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tblView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
    }
    
    
}
