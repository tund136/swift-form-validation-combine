//
//  ValidationError.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation

enum ValidationError: Error {
case custom(message: String)
}

extension ValidationError {
    var errorDescription: String {
        switch self {
        case .custom(let message):
            return message
        }
    }
}
