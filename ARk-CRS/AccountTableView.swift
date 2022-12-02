//
//  AccountTableView.swift
//  ARk-CRS
//
//  Created by Gamika on 30/11/2022.
//

import UIKit

class AccountTableView: UITableViewCell {

    @IBOutlet weak var lbl_INTname: UILabel!
    @IBOutlet weak var lbl_namezone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
