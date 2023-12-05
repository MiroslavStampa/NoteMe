//
//  UIView+Styles.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 19.11.23.
//

import UIKit

extension UIView {
    
    static func infoView() -> UIView{
        let view = UIView()
        
        view.cornerRadius = 5.0
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.appBlack.cgColor
        view.layer.shadowOpacity = 0.5//0.05
        view.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        view.layer.shadowRadius = 4
        
        return view
    }
    static func contentView() -> UIView{
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }
    
}
