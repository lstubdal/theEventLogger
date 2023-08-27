//
//  theEventLoggerApp.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 03/08/2023.
//

import SwiftUI
import FirebaseCore
import CoreLocation


class AppDelegate: NSObject, UIApplicationDelegate, CLLocationManagerDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      let locationManager = CLLocationManager() // initiliaze location manager
      locationManager.requestAlwaysAuthorization() // request permission for location
      
      // rememeber! handle when user says deny or only when in use
      
      // get access to location
      locationManager.startMonitoringSignificantLocationChanges() // significant location changes
      locationManager.delegate = self
      
    return true
  }
}

// callback that happens when CLLocationManager records a new location
extension AppDelegate {
  func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
    let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
  
  }
}


@main
struct theEventLoggerApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ReportView()
        }
    }
}
