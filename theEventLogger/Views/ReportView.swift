//
//  NewReportView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 04/08/2023.
//

import SwiftUI

struct ReportView: View {
    @ObservedObject var vm = ReportViewModel() // new vm object
    @State var currentAge: Int = 0
    @State var currentNumberOfPeople: Int = 0
    @State var currentLogger: String = "Type here"
    @State var currentGender: Gender = .female
    @State var currentAssistance: Assistance = .intoxicatedPerson
    @State var currentObservation: Observation = .theft
    @State var currentCharacteristics: String = ""
    @State var currentDescriptionEvent : String = ""
    
    enum Gender: String, CaseIterable, Identifiable {
        case male, female, other
        var id: Self { self }
    }

    enum Assistance: String, CaseIterable, Identifiable {
        case intoxicatedPerson = "Intoxicated person"
        case injuredPerson = "Injured person"
        case theft
        case directions
        case escortService
        case other
        var id: Self { self }
    }
    
    enum Observation: String, CaseIterable, Identifiable {
        case theft
        case possiblePirateTaxi = "Possible pirate taxi"
        case physicalViolence = "Physical violence"
        case arguing
        case intoxication
        case accumulation
        case vandalism
        case ok = "All OK/other"
        var id: Self { self }
    }
    
    var numberFormatter: NumberFormatter = {
        var currentNumber = NumberFormatter() //set type to integer
        currentNumber.zeroSymbol = "" // Hide number before assigned value
        return currentNumber
    }()
    
    var body: some View {
        
        ScrollView {
            HeaderView(title: "New report", description: "Type in details about the event")
            
            Group {
                
                VStack {
                    Text("Select gender of person")
                        .font(.system(size: 22))
                        .padding()
                    Picker("Gender", selection: $currentGender){
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                        Text("Other").tag(Gender.other) // relevant?
                    }
                    .pickerStyle(.segmented)
                }
                .fixedSize()
                
                VStack {
                    // age of person
                   NumberInputView(title: "Age of person",  value: $currentAge)
                   
                    // number of people involved
                   NumberInputView(title: "Number of people",  value: $currentNumberOfPeople)
                }
                .padding()
            }
            
            Group {
                // menu picker: assistance
                Divider()
                    .padding()
                
                VStack {
                // type of assistance
                    Text("Type of assistance")
                    .bold()
                    .offset(y: 40)
                    Form {
                        Picker("Assistance ", selection: $currentAssistance) {
                            ForEach(Assistance.allCases, id: \.rawValue) { item in
                                Text(item.rawValue.capitalized).tag(item)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .pickerStyle(.menu)
                    }
                    .frame(height: 130)
                    .scrollContentBackground(.hidden) // remove form default color
                
                // type of observation
                    Text("Type of observation")
                    .bold()
                    .offset(y: 40)
                    Form {
                        Picker("Assistance ", selection: $currentObservation) {
                            ForEach(Observation.allCases, id: \.rawValue) { item in
                                Text(item.rawValue.capitalized).tag(item)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .pickerStyle(.menu)
                    }
                    .frame(height: 130)
                    .scrollContentBackground(.hidden) // remove form default color
                }
                .padding()
                
                
                // description of characteristics
                TextEditorView(title: "Charachteristic/clothing", textInput: $currentCharacteristics)
                
                // description of event
                TextEditorView(title: "Description event", textInput: $currentDescriptionEvent)
                
                // textfield input
                HStack {
                    Text("Name of logger")
                    TextField("Type in logger", text: $currentLogger)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .padding()
                }
                .frame(width: 300, height: 15)
                .padding()
                
                Divider()
                    .padding()
       
                Button("send to database", action: {
                    vm.sendToDatabase(Report(logger: currentLogger, age: currentAge, gender: currentGender.rawValue, assistance: currentAssistance.rawValue, charactheristics: currentCharacteristics, description: currentDescriptionEvent, numberOfPeople: currentNumberOfPeople, observation: currentObservation.rawValue))
                })
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
