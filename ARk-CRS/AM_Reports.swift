//
//  AM_Reports.swift
//  ARk-CRS
//
//  Created by Gamika on 27/11/2022.
//

import UIKit

class AM_Reports: UIViewController {

    
    @IBOutlet weak var btn_report: UIButton!
    
    @IBOutlet weak var pls_btn: UIButton!
    @IBOutlet weak var txtfield_report: UITextField!
    
    @IBOutlet weak var mytableview_reports: UITableView!
    
    var list_reports : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        design_btns()

    }
    
    private func addLableGeature() {
//        pls_btn.addGestureRecognizer(UIGestureRecognizer(target: .none, action: #lableDateTab))
    }
    
    @objc func lableDateTab() {
        //show date picker
    }
    

    @IBAction func btn_report_action(_ sender: Any) {
        showalert()
    }
    
    
    @IBAction func btn_send_report(_ sender: Any) {
        
        guard let data = txtfield_report.text
        else{
            return
        }
        list_reports.append(data)
        mytableview_reports.reloadData()
        
    }
    
    // func to show alert for users
    
    func showalert(){
    let alert = UIAlertController(title: "Report For this day ? ", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler:nil))
           
        alert.addAction(UIAlertAction(title: "No", style: .default, handler:nil))
    present(alert, animated: true, completion: nil)
}
    
    // func to make btn as cirucles and have cornals
    
    func design_btns (){
        
        pls_btn.layer.cornerRadius = pls_btn.frame.width / 2
        pls_btn.layer.masksToBounds = true
        btn_report.layer.cornerRadius = 15
        btn_report.layer.masksToBounds = true
        
    }
    
}

// this for show reports in table view

extension AM_Reports : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list_reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableview_reports.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Amreports_tablecell
        cell.lbl_contain_report.text = list_reports[indexPath.row]
        cell.lbl_name_user.text = "Gamal Shawky"
        txtfield_report.text = ""
        return cell
        
    }
    
    
}


