//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Zepiao Han on 12/31/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel!
    
    
    @IBOutlet weak var tblView: UITableView!
    
    static func instantiate(viewModel: RestaurantListViewModel) -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchRestaurantViewModels()
            .observeOn(MainScheduler.instance)
            .bind(to: tblView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            
            cell.textLabel?.text = viewModel.displayText
            
        }.disposed(by: disposeBag)
    }


}

