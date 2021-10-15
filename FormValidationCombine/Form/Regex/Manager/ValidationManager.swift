//
//  ValidationManager.swift
//  FormValidationCombine
//
//  Created by Danh Tu on 15/10/2021.
//

import Foundation

protocol ValidationManager {
    func validate(_ val: Any) -> ValidationError?
}

