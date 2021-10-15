//
//  ButtonFormView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct ButtonFormView: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Title here")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
        })
            .frame(maxWidth: .infinity, minHeight: 44, alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

struct ButtonFormView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFormView()
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
            .previewDisplayName("Button Form View")
    }
}
