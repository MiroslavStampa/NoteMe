//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 14.11.23.
//

import UIKit

protocol RegisterPresenterDelegate: AnyObject {
    
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
}

final class RegisterPresenter: RegisterPresenterProtocol {
    
    weak var delegate: RegisterPresenterDelegate?
    
    func registerDidTap(email: String?, password: String?, repeatPassword: String?) {
        //<#code#>
    }
    
    func haveAccountDidTap() {
        
    }
}
