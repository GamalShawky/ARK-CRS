//
//  Accounts.swift
//  ARk-CRS
//
//  Created by Gamika on 30/11/2022.
//

import UIKit

class Accounts: UIViewController {
    
    var listAccounts : [String] = ["Arab Contractors" , "Cliopatr Private","Arab Contractors" , "Cliopatr Private","Arab Contractors" , "Cliopatr Private"]

    @IBOutlet weak var account_tableview: UITableView!
    @IBOutlet weak var txtfield_ZoneName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        account_tableview.delegate = self
        account_tableview.dataSource = self

        
    }
    


}
// this for table view in accounts page 

extension Accounts : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = account_tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountTableView
        cell.lbl_namezone.text = listAccounts[indexPath.row]
        cell.lbl_INTname.text = "INT"
        return cell
    }
    
    
    
}
