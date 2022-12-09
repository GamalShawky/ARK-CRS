//
//  ProspectionTableViewCell.swift
//  ARk-CRS
//
//  Created by Gamika on 02/12/2022.
//

import UIKit

class ProspectionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var selectanswerbtn: UIButton!
    @IBOutlet weak var answerlabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setdata (title: String , isselected : Bool) {
        
        answerlabel.text = title
        selectanswerbtn.setImage((isselected ? UIImage(systemName: "circle.inset.filled") : UIImage(systemName: "circle")) ?? UIImage() , for: .normal)
    }

}
