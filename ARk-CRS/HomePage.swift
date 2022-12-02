//
//  HomePage.swift
//  ARk-CRS
//
//  Created by Gamika on 28/11/2022.
//

import UIKit
import SideMenu

class HomePage: UIViewController {
    
    var menu : SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()

       menu = SideMenuNavigationController(rootViewController: MenuSide_tablecontroller())
       // menu?.setNavigationBarHidden(true, animated: false)
        
        
    }
    

    @IBAction func btn_sidemenu(_ sender: Any) {
        present(menu!, animated: true)
    }
    

}

class MenuSide_tablecontroller : UITableViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    enum Menuoptions : String ,CaseIterable{
        case Home = "Home"
        case AMReports = "AM Reports"
        case PMReports = "PM Reports"
        case Accounts = "Accounts"
        
        var imagename : String {
            switch self {
            case .Home:
                return "house"
            case .AMReports:
                return "airplane"
            case .PMReports:
                return "airplane"
            case .Accounts:
                return "airplane"
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menuoptions.allCases.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(systemName: Menuoptions.allCases[indexPath.row].imagename)
        cell.textLabel?.text = Menuoptions.allCases[indexPath.row].rawValue
        
        cell.imageView?.tintColor = .darkGray
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("hello")
    }
}
