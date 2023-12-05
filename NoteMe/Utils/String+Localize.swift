//
//  String+Localize.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 19.11.23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
