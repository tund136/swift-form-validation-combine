//
//  DateFormView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct DateFormView: View {
    let component: DateFormComponent
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker("", selection: .constant(Date()), displayedComponents: [component.mode])
                .labelsHidden()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Error here")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
        }
    }
}

struct DateFormView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormView(component: .init(id: .dob, mode: .date))
            .previewDisplayName("Date Form")
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
    }
}
