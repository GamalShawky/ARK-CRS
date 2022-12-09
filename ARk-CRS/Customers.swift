//
//  Customers.swift
//  ARk-CRS
//
//  Created by Gamika on 30/11/2022.
//

import UIKit

class Customers: UIViewController {
    
    var listcustomers : [String] = ["احمد الخطيب محمد" , "أسامه عكاشه محمد","احمد الخطيب محمد" , "أسامه عكاشه محمد","احمد الخطيب محمد" , "أسامه عكاشه محمد"]
    
    
    

    @IBOutlet weak var Customers_TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        Customers_TableView.dataSource = self
        Customers_TableView.delegate = self
    }
    


}

// this for table view in accounts page

extension Customers : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listcustomers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Customers_TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomerTableView
        cell.lbl_CustomerName.text = listcustomers[indexPath.row]
        return cell
    }
    
    
    
}
