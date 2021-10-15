//
//  TextFieldFormView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct TextFieldFormView: View {
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Placeholder here", text: .constant(""))
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.leading)
                .keyboardType(.default)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.25))
                )
            
            Text("Error here")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
        }
    }
}

struct TextFieldFormView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldFormView()
            .padding(.horizontal)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Text Field")
    }
}
