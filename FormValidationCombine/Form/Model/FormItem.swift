//
//  FormItem.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation
import UIKit
import SwiftUI

// Implementation for a form item
protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var validations: [ValidationManager] { get }
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
    
    let validations: [ValidationManager]
    
    var val: Any?
    
    init(_ id: FormField, validations: [ValidationManager] = []) {
        self.formId = id
        self.validations = validations
    }
}

// MARK: Text Component
final class TextFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(id: FormField, placeholder: String, keyboardType: UIKeyboardType = .default, validations: [ValidationManager] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id, validations: validations)
    }
}

// MARK: Date Component
final class DateFormComponent: FormComponent {
    let mode: DatePickerComponents
    init(id: FormField, mode: DatePickerComponents, validations: [ValidationManager] = []) {
        self.mode = mode
        super.init(id, validations: validations)
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
