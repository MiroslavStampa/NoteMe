//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 14.11.23.
//

import UIKit

protocol RegisterCoordinatorProtocol: AnyObject {
    
    func finish()
}

protocol RegisterPresenterDelegate: AnyObject {
    
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
    func keyboardFrameChanged(_ frame: CGRect)
    
}

final class RegisterPresenter: RegisterPresenterProtocol {
    
    weak var delegate: RegisterPresenterDelegate?
    
    private weak var coordinator: RegisterCoordinatorProtocol?
    
    private let keyboardHelper: KeyboardHelper
    
    init(coordinator: RegisterCoordinatorProtocol,
        keyboardHelper: KeyboardHelper) {
        self.coordinator = coordinator
        self.keyboardHelper = keyboardHelper
        bind()
    }
    
    private func bind(){
        keyboardHelper.onWillShow { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }.onWillHide { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }
    }
    
    func registerDidTap(email: String?, password: String?, repeatPassword: String?) {
        print(Self.self,#function)
        //add auth service
        coordinator?.finish()
    }
    
    func haveAccountDidTap() {
        print(#function,Self.self)
        coordinator?.finish()
    }
}
