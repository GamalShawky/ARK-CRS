//
//  login_form.swift
//  ARk-CRS
//
//  Created by Gamika on 26/11/2022.
//

import UIKit
import DropDown


class login_form: UIViewController {

    @IBOutlet weak var lbl_titlemenu: UILabel!
    @IBOutlet weak var dropmenu_view: UIView!
    
    let dropDown = DropDown()
    let list_dropdown = ["Representative","First_ line_Manager","Middle_Manager","Higher_Manager"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        design_dropdown()
    }
    

    @IBAction func btn_select_item_menu(_ sender: Any) {
        
        dropDown.show()
    }
    
    func design_dropdown () {
       
       dropDown.anchorView = dropmenu_view
       dropDown.dataSource = list_dropdown
      lbl_titlemenu.text = "Select Item From Menu "
       
       dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
       dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
       dropDown.direction = .bottom
        
        DropDown.appearance().textFont = UIFont.systemFont(ofSize: 25)
       
       dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
         print("Selected item: \(item) at index: \(index)")
           self.lbl_titlemenu.text = list_dropdown[index]
       }
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
