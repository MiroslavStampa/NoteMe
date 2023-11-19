//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 14.11.23.
//

import UIKit
import SnapKit

@objc protocol RegisterPresenterProtocol {
    func registerDidTap(email: String?,
                        password: String?,
                        repeatPassword: String?)
    @objc optional func haveAccountDidTap()
}

//final class RegisterVC: UIViewController {
//    //private lazy var contentView: UIView = .contentView()
//    //private lazy var logoContainer: UIView
//    //private lazy var register
//    
//    
//    private var viewModel: RegisterPresenterProtocol
//    
//    @objc private func registerDidTap() {
//       // viewModel.registerDidTap(email: emailTextField.text,
//       //                          password: passwordTextField.text,
//        //                         repeatPassword: repeatPasswordTextField.text)
//    }
//}
//
//extension RegisterVC: RegisterPresenterDelegate {
//    func setEmailError(error: String?) {
//       // emailTextField.errorText = error
//    }
//    
//    func setPasswordError(error: String?) {
//       // passwordTextField.errorText = error
//    }
//    
//    func setRepeatPasswordError(error: String?) {
//       // repeatPasswordTextField.errorText = error
//    }
//    
//    
//}
