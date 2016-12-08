//
//  ElementTableViewCell.swift
//  Elements
//
//  Created by Eric Chang on 12/8/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {

    @IBOutlet weak var elementImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        elementImageView.image = nil
    }

}
