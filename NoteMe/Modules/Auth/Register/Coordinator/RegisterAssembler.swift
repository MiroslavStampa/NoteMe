//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 14.11.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() {}
    static func make(coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: .init())
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        return vc
    }
}
