//
//  ContentView.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 44))], spacing: 20) {
                ForEach(contentBuilder.content) { component in
                    switch component {
                    case is TextFormComponent:
                        TextFieldFormView(component: component as! TextFormComponent)
                            .environmentObject(contentBuilder)
                    case is DateFormComponent:
                        DateFormView(component: component as! DateFormComponent)
                            .environmentObject(contentBuilder)
                    case is ButtonFormComponent:
                        ButtonFormView(component: component as! ButtonFormComponent)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.top, 100)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
