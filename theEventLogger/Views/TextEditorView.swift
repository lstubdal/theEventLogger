//
//  textEditorView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 13/08/2023.
//

import SwiftUI

struct TextEditorView: View {
    let title: String
    @Binding var textInput: String
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.system(size: 22))
                .padding()
            TextEditor(text: $textInput)
                .foregroundColor(.black) // Text color
                .frame(width: 300, height: 200)
                .scrollContentBackground(.hidden) // <- Hide it
                .background(Color.black.opacity(0.05))
                .cornerRadius(7)
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(title: "title", textInput: .constant("Type here..."))
    }
}
