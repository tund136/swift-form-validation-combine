//
//  RegexPatterns.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation

enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}
