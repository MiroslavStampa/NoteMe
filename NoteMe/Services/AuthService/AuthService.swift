//
//  AuthService.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 10.12.23.
//


import FirebaseAuth

final class AuthService {
    private var firebase: Auth {
        return Auth.auth()
    }
    func singIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        firebase.signIn(withEmail: email, password: password) { result,error in
            completion(error == nil)
        }
    }
}