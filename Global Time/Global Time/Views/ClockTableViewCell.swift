//
//  ClockTableViewCell.swift
//  Global Time
//
//  Created by Sean Acres on 7/18/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {

    @IBOutlet weak var timeZoneName: UILabel!
    @IBOutlet weak var clockView: ClockView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
