//
//  StarTableViewCell.swift
//  Stars(iOSPT5)
//
//  Created by David Williams on 2/13/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {
    
    var star: Star? {
           didSet {
               updateViews()
           }
       }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    private func updateViews() {
        //guard let star = star else { return }
        nameLabel.text = star?.name
        distanceLabel.text = star?.distanceDescription
    }
}
