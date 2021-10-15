//
//  FormState.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation

struct User: Equatable {
    let firstName: String
    let lastName: String
    let email: String
    let dob: Date
}

enum FormState {
    case valid(user: User)
    case fail(error: ValidationError)
}

extension FormState: Equatable {
    static func == (lhs: FormState, rhs: FormState) -> Bool {
        switch(lhs, rhs) {
        case (.valid(user: let lhsType), .valid(user: let rhsType)):
            return lhsType == rhsType
        case (.fail(error: let lhsType), .fail(error: let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        default:
            return false
        }
    }
}
