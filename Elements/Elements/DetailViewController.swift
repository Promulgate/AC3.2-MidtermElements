//
//  DetailViewController.swift
//  Elements
//
//  Created by Eric Chang on 12/8/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var elementImageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var meltingLabel: UILabel!
    @IBOutlet weak var boilingLabel: UILabel!
    @IBOutlet weak var densityLabel: UILabel!
    @IBOutlet weak var electronsLabel: UILabel!
    
    var element: Element?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = element?.name
        loadData()
    }
    
    func loadData() {
        guard let ele = element else { return }
        symbolLabel.text = String(ele.id)
        nameLabel.text = ele.name
        weightLabel.text = "Weight: \(String(ele.weight))"
        meltingLabel.text = "Melting Point: \(String(ele.melting))"
        boilingLabel.text = "Boiling Point: \(String(ele.boiling))"
        densityLabel.text = "Density: \(String(ele.density))"
        electronsLabel.text = "Electrons: \(ele.electrons)"
        
        APIRequestManager.manager.getData(endPoint: "https://s3.amazonaws.com/ac3.2-elements/\(ele.symbol).png") { (returnedData: Data?) in
            DispatchQueue.main.async {
                self.elementImageLabel.image = UIImage(data: returnedData!)
            }
        }
    }
    
    @IBAction func favorited(_ sender: UIBarButtonItem) {
        let data: [String:Any] = ["my_name" : "Eric Chang",
                    "favorite_element" : element!.symbol]
        print(element!.symbol)
        APIRequestManager.manager.postRequest(endPoint: "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/favorites", data: data)
        
    }
    
    
    
}
