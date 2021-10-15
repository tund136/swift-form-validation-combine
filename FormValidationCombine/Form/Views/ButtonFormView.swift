//
//  ButtonFormView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct ButtonFormView: View {
    typealias ButtonActionHandler = (_ formId: FormField) -> Void
    
    let component: ButtonFormComponent
    let handler: ButtonActionHandler
    
    init(component: ButtonFormComponent, handler: @escaping ButtonFormView.ButtonActionHandler) {
        self.component = component
        self.handler = handler
    }
    
    var body: some View {
        Button(action: {
            handler(component.formId)
        }, label: {
            Text(component.title)
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
        ButtonFormView(component: .init(id: .submit, title: "Title here")) { _ in }
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
            .previewDisplayName("Button Form View")
    }
}
