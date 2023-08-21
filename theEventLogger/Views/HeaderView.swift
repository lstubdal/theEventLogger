//
//  HeaderView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 04/08/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 32))
                .bold()
                .navigationTitle(title)
                .padding(.top, 50)
            Text(description)
              .font(.system(size: 21))
        }
        .frame(width: 450, height: 250)
        .background(Color.accentColor)
        .foregroundColor(.white)
        .offset(y: -50)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title here", description: "Description here")
    }
}
