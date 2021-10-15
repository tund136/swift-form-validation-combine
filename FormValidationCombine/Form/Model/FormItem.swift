//
//  FormItem.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation
import UIKit

// Implementation for a form item
protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var val: Any? { get }
}

// Unique enum for the form
enum FormField {
    case firstName
    case lastName
    case email
    case dob
    case submit
}

// MARK: Base Form Compponent
class FormComponent: FormItem, Identifiable {
    let id = UUID()
    
    let formId: FormField
    
    var val: Any?
    
    init(_ id: FormField) {
        self.formId = id
    }
}

// MARK: Text Component
final class TextFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(id: FormField, placeholder: String, keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id)
    }
}

// MARK: Date Component
final class DateFormComponent: FormComponent {
    let mode: UIDatePicker.Mode
    init(id: FormField, mode: UIDatePicker.Mode) {
        self.mode = mode
        super.init(id)
    }
}

// MARK: Button Component
final class ButtonFormComponent: FormComponent {
    let title: String
    
    init(id: FormField, title: String) {
        self.title = title
        super.init(id)
    }
}
