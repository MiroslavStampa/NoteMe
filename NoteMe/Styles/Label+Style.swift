//
//  Label+Style.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 19.11.23.
//

import UIKit

extension UILabel {
    
    static func mainTitleLabel(_ text: String?) -> UILabel{
        let label = UILabel()
        label.text = text
        label.font = .appBoldFont.withSize(25.0)
        return label
    }
}
