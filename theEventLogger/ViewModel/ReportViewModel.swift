//
//  ReportVM.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 14/08/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ReportViewModel: ObservableObject {
    @Published private var reportModel = ReportModel() // new object of model
    
    private let ref = Database.database().reference() // root of database
    
   /* var reports: [Report] {
        return reportModel.reports // access reports
    }
    
    func addReport(_ report: Report) {
        reportModel.addReport(report)
    } */
    
    func sendToDatabase(_ report: Report) {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(report) // to convert to json object
        let newJsonReport = String(data: jsonData, encoding: String.Encoding.utf8) // stringify it
        
        ref.child("\(report.id)").setValue(newJsonReport) // push to database
    }
}



