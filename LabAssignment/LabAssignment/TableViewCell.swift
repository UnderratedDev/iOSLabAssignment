//
//  TableViewCell.swift
//  LabAssignment
//
//  Created by Yudhvir Raj on 2017-12-01.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var title: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
