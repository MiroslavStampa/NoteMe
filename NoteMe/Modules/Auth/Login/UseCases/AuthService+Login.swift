//
//  AuthService+Login.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 5.12.23.
//

import Foundation

extension AuthService: LoginAuthServiceUseCase {
    func login(email: String,
               password: String,
               completion: @escaping (Bool) -> Void) {
        self.singIn(email: email, password: password, completion: completion)
    }
}
