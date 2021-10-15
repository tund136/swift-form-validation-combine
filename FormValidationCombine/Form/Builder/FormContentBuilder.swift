//
//  FormContentBuilder.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation
import Combine

protocol FormContentBuilder {
    var content: [FormComponent] { get }
    func update(_ val: Any, in component: FormComponent)
}

final class FormContentBuilderImpl: FormContentBuilder, ObservableObject {
    private(set) var content: [FormComponent] = [
        TextFormComponent(
            id: .firstName,
            placeholder: "First Name",
            validations: [
                RegexValidationManagerImpl(
                    [
                        RegexFormItem(
                            pattern: RegexPatterns.name,
                            error: .custom(message: "Invalid First Name Entered!")
                        )
                    ]
                )
            ]
        ),
        TextFormComponent(
            id: .lastName,
            placeholder: "Last Name",
            validations: [
                RegexValidationManagerImpl(
                    [
                        RegexFormItem(
                            pattern: RegexPatterns.name,
                            error: .custom(message: "Invalid Last Name Entered!")
                        )
                    ]
                )
            ]
        ),
        TextFormComponent(
            id: .email,
            placeholder: "Email",
            keyboardType: .emailAddress,
            validations: [
                RegexValidationManagerImpl(
                    [
                        RegexFormItem(
                            pattern: RegexPatterns.emailChars,
                            error: .custom(message: "Invalid Email missing @!")
                        ),
                        RegexFormItem(
                            pattern: RegexPatterns.higherThanSixChars,
                            error: .custom(message: "Less than 6 characters!")
                        )
                    ]
                )
            ]
        ),
        DateFormComponent(
            id: .dob,
            mode: .date,
            validations: [DateValidatorManagerImpl()]
        ),
        ButtonFormComponent(id: .submit, title: "Confirm")
    ]
    
    func update(_ val: Any, in component: FormComponent) {
        guard let index = content.firstIndex(where: { $0.id == component.id })
        else {
            return
        }
        
        content[index].val = val
    }
}
