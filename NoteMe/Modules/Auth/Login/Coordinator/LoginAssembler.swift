//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 10.11.23.
//

import UIKit

final class LoginAssembler {
    private init() {}
    
    static func make(coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let vm = LoginVM(coordinator: coordinator,
                         authService: AuthService(),
                         inputValidator: InputValidator())
    return LoginVC(viewModel: vm)
    }
    
  
}


