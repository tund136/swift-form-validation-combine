//
//  DateFormView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct DateFormView: View {
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    
    @State private var selectedDate = Date()
    @State private var error: ValidationError?
    
    let component: DateFormComponent
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker("", selection: $selectedDate, displayedComponents: [component.mode])
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(error?.errorDescription ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
        }
        .onChange(of: selectedDate, perform: { value in
            contentBuilder.update(selectedDate, in: component)
            
            error = component.validations
                .compactMap { $0.validate(selectedDate) }
                .first
        })
    }
}

struct DateFormView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormView(component: .init(id: .dob, mode: .date))
            .environmentObject(FormContentBuilderImpl())
            .previewDisplayName("Date Form")
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
    }
}
