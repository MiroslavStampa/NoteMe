//
//  LoginVM.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 10.11.23.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorProtocol: AnyObject {
    func finish()
    func openRegisterModule()
    func openResetModule()
    func showAlert(_ alert: UIAlertController)
}

protocol LoginInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol LoginAuthServiceUseCase {
    func login(email: String,
               password: String,
               completion:@escaping (Bool) -> Void)
}

final class LoginVM: LoginViewModelProtocol{
    var catchEmailError: ((String?) -> Void)?
    
    var catchPasswordError: ((String?) -> Void)?
    
    private weak var coordinator: LoginCoordinatorProtocol?
    
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    
    init(coordinator: LoginCoordinatorProtocol,
         authService: LoginAuthServiceUseCase,
         inputValidator:LoginInputValidatorUseCase) {
        self.coordinator = coordinator
        self.authService = authService
        self.inputValidator = inputValidator
    }
    
    func loginDidTap(email: String?, password: String?) {
        
        guard
            checkValidation(email: email, password: password),
            let email, let password
        else {return}
        
        Auth.auth().signIn(withEmail: email,
                           password: password) { [weak self] authResult, error in
            print(authResult,error)
            //  guard let strongSelf = self else { return }
        }
        
//        authService.login(email: email, password: password) { [weak coordinator] isSuccess in
//            print(isSuccess,#function,Self.self)
//            if isSuccess {
//                ParametersHelper.set(.authenticated, value: true)
//                coordinator?.finish()
//            }
//        }
        
    }
    
    func newAccountDidTap() {
        print(#function,Self.self)
        coordinator?.openRegisterModule()
    }
    
    func forgotPasswordDidTap(email: String?) {
        print(Self.self, #function)
        coordinator?.openResetModule()
    }
    
    private func checkValidation(email: String?, password: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        catchEmailError?(isEmailValid ? nil : "wrong_e_mail".localized )
        catchPasswordError?(isPasswordValid ? nil : "non_valid_password".localized)
            return isEmailValid && isPasswordValid
    }
}
