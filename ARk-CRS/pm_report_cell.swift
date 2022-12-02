//
//  pm_report_cell.swift
//  ARk-CRS
//
//  Created by Gamika on 27/11/2022.
//

import UIKit


class pm_report_cell: UITableViewCell {
    
    
   
   
    @IBOutlet weak var lbl_contains_report: UILabel!
    
    @IBOutlet weak var lbl_person_report: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
