//
//  StringExtensions.swift
//  Roomy
//
//  Created by Awady on 7/26/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
