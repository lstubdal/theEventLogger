//
//  theEventLoggerApp.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 03/08/2023.
//

import SwiftUI
import FirebaseCore
import CoreLocation


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      let locationManager = CLLocationManager() // initiliaze location manager
      locationManager.requestAlwaysAuthorization() // request permission for location
      
    return true
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
