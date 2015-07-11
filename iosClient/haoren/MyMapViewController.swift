//
//  MyMapViewController.swift
//  haoren
//
//  Created by Zide Meng on 7/11/15.
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
import MapKit
class MyMapViewController: UIViewController {
    
    
    @IBOutlet weak var myMap: MKMapView!
    
    
    
    func initMap(){
        let location = CLLocationCoordinate2D(
            latitude: 39.980790,
            longitude: 116.351900
            
            
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        myMap.setRegion(region, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        //println("i load subviews")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 76.0/255.0, green: 152/255.0, blue: 198/255.0, alpha: 1)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

