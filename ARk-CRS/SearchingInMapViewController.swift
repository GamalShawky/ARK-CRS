//
//  SearchingInMapViewController.swift
//  ARk-CRS
//
//  Created by Gamika on 27/12/2022.
//

import UIKit
import MapKit
import CoreLocation

class SearchingInMapViewController: UIViewController , CLLocationManagerDelegate {

    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var SearchingPlaceTxt: UITextField!
    
    var locationmanager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        
        if islocationservice_enabled(){
            Check_Authorization()
        }
        else{
            showalert(msg: "Please , Enable Your Location ")
        }
    }
    
    func islocationservice_enabled () -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    
    func showalert(msg : String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
     //  علشان دي تتنفذ لازم تعطي برميشن ف فايل info
  
    // دي الاوامر الي المفروض تضاف  Privacy - Location Always and When In Use Usage Description
    // Privacy - Location When In Use Usage Description
    func Check_Authorization () {
        
        switch locationmanager.authorizationStatus {
        case .notDetermined:
            locationmanager.requestWhenInUseAuthorization()
            
            break
        case.authorizedWhenInUse :
            locationmanager.startUpdatingLocation()
            mapview.showsUserLocation = true
            break
        case .authorizedAlways :
            locationmanager.startUpdatingLocation()
            mapview.showsUserLocation = true
            break
        case.denied :
            showalert(msg: "please , enabled location setting")
            break
        case.restricted :
            showalert(msg: "please , enabled location setting")
            break
            
        default:
            print("New case of check Authorization")
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc_region = locations.last{
            print("location \(loc_region)")
            zoominlocation(location: loc_region)
        }
    }
     
    
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         
         switch status {
             
         case.authorizedWhenInUse :
             locationmanager.startUpdatingLocation()
             mapview.showsUserLocation = true
             break
         case .authorizedAlways :
             locationmanager.startUpdatingLocation()
             mapview.showsUserLocation = true
             break
         case.denied :
             showalert(msg: "please , enabled location setting")
             break
             
         default:
             print("New case of check Authorization")
         }
     }
    
    func zoominlocation(location : CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 30.033333, longitudinalMeters: 31.233334)
        mapview.setRegion(region, animated: true)
        
    }
    
    
    
    @IBAction func SearchingBtn(_ sender: Any) {
        
        if SearchingPlaceTxt.text != "" {
            searchforplaces(destination: SearchingPlaceTxt.text!)
            
        }
        
        else{
            showalert(msg: " Please enter your destination ")
        }
        
    }
    
    
    func searchforplaces (destination : String) {
        
        let geocodertext = CLGeocoder()
        
        geocodertext.geocodeAddressString(destination) { places, error in
            
            guard let place = places?.first , error == nil else{
                self.showalert(msg: "Not Found the place your searching about")
                return}
            
            guard let location = place.location else{return}
            self.SearchingPlaceTxt.text = ""
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
            self.mapview.setRegion(region, animated: true)
            
        }
        
    }
    
}
