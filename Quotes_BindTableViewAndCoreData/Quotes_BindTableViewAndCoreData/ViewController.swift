//
//  ViewController.swift
//  Quotes_BindTableViewAndCoreData
//
//  Created by Zepiao Han on 1/4/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var activitiIndicatorView: UIActivityIndicatorView!
    
    private let persistentContainer = NSPersistentContainer(name: "Quotes_BindTableViewAndCoreData")
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Quote> = {
        let fetchRequest: NSFetchRequest<Quote> = Quote.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        
        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.persistentContainer.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblView.delegate = self
        tblView.dataSource = self
                
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("\(error), \(error.localizedDescription)")
            } else {
                self.setupView()
                
                do {
                    try self.fetchedResultsController.performFetch()
                } catch {
                    let fetchError = error as NSError
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }
                
                self.updateView()
            }
        }
    }
    
    private func setupView() {
        messageLabel.text = "You don't have any quotes yet."
        updateView()
    }

    private func updateView() {
        var hasQuotes = false
        if let quotes = fetchedResultsController.fetchedObjects {
            hasQuotes = quotes.count > 0
        }
        
        tblView.isHidden = !hasQuotes
        messageLabel.isHidden = hasQuotes
        
        activitiIndicatorView.stopAnimating()
    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let quotes = fetchedResultsController.fetchedObjects else {return 0}
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? QuoteTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        
        let quote = fetchedResultsController.object(at: indexPath)
        
        cell.autherLabel.text = quote.author
        cell.contentsLabel.text = quote.contents
        
        return cell
    }
    
    
}
