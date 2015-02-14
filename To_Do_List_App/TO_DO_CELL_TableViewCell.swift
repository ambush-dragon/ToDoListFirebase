//
//  TO_DO_CELL_TableViewCell.swift
//  To_Do_List_App
//
//  Created by Panacloud on 09/02/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit

class TO_DO_CELL_TableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
  
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
