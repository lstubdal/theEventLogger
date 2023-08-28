//
//  ReportVM.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 14/08/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import CoreLocation

class ReportViewModel: ObservableObject {
    @Published private var reportModel = ReportModel() // new object of model
    let locationManager = CLLocationManager() // initialize manager
    private let ref = Database.database().reference() // root of database
    
    // add reference
    func sendToDatabase(_ report: Report) {
        requestUserLocation()
        
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(report) // to convert to json object
        let newJsonReport = String(data: jsonData, encoding: String.Encoding.utf8) // stringify it
        
        ref.child("\(report.id)").setValue(newJsonReport) // push to database
    }
    
    func requestUserLocation() {
        // get access to location
        locationManager.startMonitoringSignificantLocationChanges() // significant location changes
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        print("location started")
    }
}



