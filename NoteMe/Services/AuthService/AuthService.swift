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
            print(error?.localizedDescription)
            completion(error == nil)
        }
    }

    func createUser(email:String,
                    password: String,
                    completion: @escaping (Bool) -> Void){
        firebase.createUser(withEmail: email, password: password) { result, error in
            print(result)
            print(error)
            completion(error == nil)
        }
    }
}
