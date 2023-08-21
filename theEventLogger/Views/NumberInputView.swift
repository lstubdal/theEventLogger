//
//  NumberInputView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 13/08/2023.
//  View for nubmer inputs

import SwiftUI

struct NumberInputView: View {
    let title: String
    @Binding var value: Int
    
    /*
     create formatter to empty field before value assigned source: https://stackoverflow.com/questions/75927413/swiftui-textfields-with-integer
     */
    var numberFormatter: NumberFormatter = {
        var currentNumber = NumberFormatter() //set type to integer
        currentNumber.zeroSymbol = "" // Hide number before assigned value
        return currentNumber
    }()
    
    
    var body: some View {
        // number of people involved
    HStack  {
            Text(title)
                .font(.system(size: 22))
            TextField("Type in", value: $value, formatter: numberFormatter)
                .background(Color.black.opacity(0.05))
                .cornerRadius(7)
                .keyboardType(UIKeyboardType.numberPad)
                
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .frame(width: 100, height: 30)
        }
    }
}

struct NumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputView(title: "Title", value: .constant(0)) // constant for preview setup
    }
}
