//
//  LoginVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 24.10.23.
//

import UIKit
import SnapKit

protocol LoginViewModelProtocol {
    var catchEmailError: ((String) -> Void)? { get set }
    var catchPasswordError: ((String) -> Void)? { get set }
    
    func loginDidTap(email: String?, password: String?)
    func newAccountDidTap()
    func forgotPasswordDidTap(email:String?)
    
}

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGray
        return view
    }()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var loginButton: UIButton =
        .yellowRoudedButton("Login")
        .withAction(self, #selector(loginDidTap))
    private lazy var newAccountButton: UIButton =
        .underlineYellowButton("New Account")
        .withAction(self, #selector(newAccountDidTap))
    private lazy var fogotPasswordButton: UIButton =
        .underlineGrayButton("Fogot Password")
        .withAction(self, #selector(forgotPasswordDidTap))
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "E-mail"
        textField.placeholder = "Enter E-mail"
        return textField
    }()
    
    private var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
    }
    
    private func bind() {
        viewModel.catchEmailError = { errorText in
            self.emailTextField.errorText = errorText
        }
        
        viewModel.catchPasswordError = {
            self.passwordTextField.text = $0}
    }
    
    private func setupUI(){
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        contentView.addSubview(logoImageView)
    }
    
    
    private func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
    }
    @objc private func loginDidTap(){
        viewModel.loginDidTap(email: emailTextField.text, password: nil)
    }
    
    @objc private func newAccountDidTap(){
        viewModel.newAccountDidTap()
    }
    
    @objc private func forgotPasswordDidTap(){
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
}
