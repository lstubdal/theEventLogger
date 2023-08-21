//
//  LogInView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 04/08/2023.
//


import SwiftUI

struct LogInView: View {
    // @State - as the single source of truth for a given value type
    @State private var username = ""
    @State private var password = ""
    
    
    var body: some View {
        VStack {
            Text("Log in")
                .font(.system(size: 56))
                .bold()
                .foregroundColor(.accentColor)
            
            // change to FORMTAG
            Form {
                // username
                HStack {
                  Image(systemName: "person.circle")
                  TextField("Username", text: $username)
                        .listRowSeparator(.hidden)
                }
                .padding()
                .frame(width: 310, height: 65)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                // password
                HStack {
                  Image(systemName: "lock")
                  SecureField("Password", text: $password)
                    
                }
                .padding()
                .frame(width: 310, height: 65)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .listRowSeparator(.hidden) // remove default seperators
                
                // log in button
                Button(action: {
                    // Your code here
                  }) {
                    Text("Log in")
                      .font(.title)
                      .foregroundColor(.white)
                      .frame(width: 310, height: 60)
                      .background(Color.accentColor)
                      .cornerRadius(10)
                  }
                  .padding()
            }
            .scrollContentBackground(.hidden) // remove form default color
            Text("Don’t have password or username? Ask daily manager.")
                .padding([.bottom, .horizontal], 50)
                .multilineTextAlignment(.center)
                .offset(y: -60)
            
        }
        .offset(y: 80)
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
