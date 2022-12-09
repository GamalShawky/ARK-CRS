//
//  ProspectionViewController.swift
//  ARk-CRS
//
//  Created by Gamika on 02/12/2022.
//

import UIKit

class ProspectionViewController: UIViewController {
    
    var selectedindex : [Int?] = [nil, nil, nil,nil,nil,nil,nil,nil,nil]
    
    var listanswers = [["0-1 Patients","2-4 Patients","5 or more Patients"],["By the begining or middle os the physisian's working day","By the end of the physisian's working day"],["0-1 Patients","2-4 Patients","5 or more Patients"],["By the begining or middle os the physisian's working day","By the end of the physisian's working day"],["Not Potential" , "Potential","Very Potential"],["Spesialist","Consultant","Professor"],["Least likely will prescribes your product class","May shift to your products class","Already prescribing your product class"],["Negative","Possitive"],["EX-Customer","Exhibition or Medical Directories","Cold Canvassing or New Clinic","Peer or Colleague Referral","Center of influence (KOL)"]]
    
   
    
    var sections = ["How Many Patients Were Waiting in Your First Visit ?","When was this first visit ?","How Many patients were waiting in your last visit ?","When Was this last visit ?","How did the nearest pharmacist describe the prospected customer ?", "What is the right discription of the prospected customer ?","How did the nearest pharmacist describe the prospected customer ?","How was his reply on asking for a commitment ?","Who suggested this prospect ?"]

    @IBOutlet weak var prospectiontableview: UITableView!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prospectiontableview.delegate = self
        prospectiontableview.dataSource = self
        
        SubmitButton.layer.cornerRadius = 15
        SubmitButton.layer.masksToBounds = true
    }
    

  

}
extension ProspectionViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listanswers[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = prospectiontableview.dequeueReusableCell(withIdentifier: "prospectioncell", for: indexPath) as! ProspectionTableViewCell
        
       
        cell.setdata(title: listanswers[indexPath.section][indexPath.row] , isselected: selectedindex[indexPath.section] == indexPath.row)
           
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedindex[indexPath.section] = indexPath.row
        
        prospectiontableview.reloadData()
    }
   
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = UIView()
        let headerlabel = UILabel()
        headerlabel.text = sections[section]
        headerlabel.frame = CGRect(x: 20, y:2 , width: 400, height: 50)
        headerlabel.textColor = .blue
        headerlabel.font = .boldSystemFont(ofSize: 20)
        headerlabel.numberOfLines = 0
        headerview.addSubview(headerlabel)
        
        return headerview
    }
  
    
    
}
