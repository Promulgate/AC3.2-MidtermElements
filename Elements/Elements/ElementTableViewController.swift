//
//  ElementTableViewController.swift
//  Elements
//
//  Created by Eric Chang on 12/8/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class ElementTableViewController: UITableViewController {
    
    var elements = [Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        APIRequestManager.manager.getData(endPoint: "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/elements") { (data: Data?) in
            if let validData = data,
                let validElements = Element.getElement(data: validData) {
                self.elements = validElements
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as! ElementTableViewCell
        let element = elements[indexPath.row]
        
        cell.nameLabel.text = element.name
        cell.infoLabel.text = "\(element.symbol) (\(element.id)) \(element.weight)"
        
        APIRequestManager.manager.getData(endPoint: "https://s3.amazonaws.com/ac3.2-elements/\(element.symbol)_200.png") { (returnedData) in
            if let validData = returnedData {
                DispatchQueue.main.async {
                    cell.elementImageView.image = UIImage(data: validData)
                }
            }
        }
        
        return cell
    }
    
    
    // MARK: - Navigation
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = (sender as? UITableViewCell).flatMap(self.tableView.indexPath) {
            (segue.destination as! DetailViewController).element = elements[indexPath.row]
        }
    }
    
}
