//
//  PM_Reports.swift
//  ARk-CRS
//
//  Created by Gamika on 27/11/2022.
//

import UIKit


class PM_Reports: UIViewController {

    
   
    @IBOutlet weak var mytable_reports: UITableView!
    @IBOutlet weak var txtfield_report: UITextField!
    @IBOutlet weak var btn_pls: UIButton!
    @IBOutlet weak var btn_report: UIButton!
    
    var list_report : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        design_btns()
        mytable_reports.dataSource = self
        mytable_reports.delegate = self
    }
    
    
    
    @IBAction func btn_report_action(_ sender: Any) {
        
        showalert()
        
    }
    
    @IBAction func btn_send_report(_ sender: Any) {
        
        
       
        guard let data = txtfield_report.text
        else{
            return
        }
        list_report.append(data)
        mytable_reports.reloadData()
    }
    
    
    
    // func to show alert for users
    
    func showalert(){
    let alert = UIAlertController(title: "Report For this day ? ", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler:nil))
            //self.lbl_show_message.text = "Visiting Day Reported"
       
           
        alert.addAction(UIAlertAction(title: "No", style: .default, handler:nil))
    present(alert, animated: true, completion: nil)
}
    
    // func to make btn as cirucles and have cornals
    
    func design_btns (){
        
        btn_pls.layer.cornerRadius = btn_pls.frame.width / 2
        btn_pls.layer.masksToBounds = true
        btn_report.layer.cornerRadius = 15
        btn_report.layer.masksToBounds = true
        
    }
    
    
    
}

// this for show reports in table view

extension PM_Reports : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list_report.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable_reports.dequeueReusableCell(withIdentifier: "cell_pm", for: indexPath) as! pm_report_cell
        cell.lbl_contains_report.text = list_report[indexPath.row]
        cell.lbl_person_report.text = "Mina Hany"
        txtfield_report.text = ""
     
        return cell
        
    }
    
    
    
    
}
