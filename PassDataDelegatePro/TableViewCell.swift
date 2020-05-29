//
//  TableViewCell.swift
//  PassDataDelegatePro
//
//  Created by admin on 2/24/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbNameCell: UILabel!
    @IBOutlet weak var lbDiaChiCell: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
