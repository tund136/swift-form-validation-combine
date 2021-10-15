//
//  TextFieldFormView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct TextFieldFormView: View {
    @State private var text = ""
    @State private var error: ValidationError?
    
    let component: TextFormComponent
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(component.placeholder, text: $text)
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.leading)
                .keyboardType(component.keyboardType)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(error == nil ? Color.gray.opacity(0.25) : Color.red)
                )
            
            Text(error?.errorDescription ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
        }
        .onChange(of: text, perform: { value in
            // Perform validation
            error = component
                .validations
                .compactMap { $0.validate(text) }
                .first
        })
    }
}

struct TextFieldFormView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldFormView(component: .init(id: .firstName, placeholder: ""))
            .padding(.horizontal)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Text Field")
    }
}
