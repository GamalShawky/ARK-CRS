//
//  ViewController.swift
//  ARk-CRS
//
//  Created by Gamika on 26/11/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    

    @IBOutlet weak var lbl_titiledropdown: UILabel!
    @IBOutlet weak var dropdown_view: UIView!
    
    
    let dropDown = DropDown()
     
    let list_dropdown = ["demo","opi","ema","provak"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      design_dropdown()
        
    }

   
    
    @IBAction func select_dropdown_btn(_ sender: Any) {
        
        dropDown.show()
    }
    
    
    
     func design_dropdown () {
        
        dropDown.anchorView = dropdown_view
        dropDown.dataSource = list_dropdown
        lbl_titiledropdown.text = "Select Item From Menu "
        
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
         
         DropDown.appearance().textFont = UIFont.systemFont(ofSize: 20)
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.lbl_titiledropdown.text = list_dropdown[index]
        }
    }
 
}

