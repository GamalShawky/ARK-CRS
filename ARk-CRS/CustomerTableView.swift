//
//  CustomerTableView.swift
//  ARk-CRS
//
//  Created by Gamika on 30/11/2022.
//

import UIKit

class CustomerTableView: UITableViewCell {

    @IBOutlet weak var lbl_CustomerName: UILabel!
    @IBOutlet weak var view_forCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
