//
//  LoginVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 24.10.23.
//

import UIKit
import SnapKit

@objc protocol LoginViewModelProtocol: AnyObject {
    var catchEmailError: ((String?) -> Void)? { get set }
    var catchPasswordError: ((String?) -> Void)? { get set }
    
    func loginDidTap(email: String?, password: String?)
    @objc func newAccountDidTap()
    func forgotPasswordDidTap(email:String?)
    
}

final class LoginVC: AuthBaseVC {
    
//    private lazy var contentView: UIView =
//        .contentView()
    
//    
//    private lazy var logoImageView: UIImageView =
//        UIImageView(image: .General.logo)
//    
//    private lazy var loginTitle: UILabel =
//        .mainTitleLabel("welcome_back".localized)
//    
//    private lazy var loginButton: UIButton =
//        .yellowRoudedButton("login".localized)
//        .withAction(self, #selector(loginDidTap))
//    
//    private lazy var newAccountButton: UIButton =
//        .underlineYellowButton("new_account".localized)
//        .withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
    
    private lazy var fogotPasswordButton: UIButton =
        .underlineGrayButton("fogot_password".localized)
        .withAction(self, #selector(forgotPasswordDidTap))
    
//    private lazy var infoView: UIView =
//        .infoView()
//    
//    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "e_mail".localized
        textField.placeholder = "enter_e_mail".localized
        return textField
    }()
    private lazy var passwordTextField: LineTextField = {
       let textField = LineTextField()
        textField.title = "password".localized
        textField.placeholder = "enter_password".localized
        return textField
    }()
    
    private var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol){
        self.viewModel = viewModel
        super.init(mainButtonTitle: "login".localized,
                   optionalBottomBottonTitle: "new_account".localized,
                   name: "welcome_back".localized)
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        print(Self.self,#function,"in loginVC")
        
    }
    
    private func bind() {
        viewModel.catchEmailError = { errorText in
            self.emailTextField.errorText = errorText
        }
        
        viewModel.catchPasswordError = {
            self.passwordTextField.errorText = $0}
        
        mainButton.withAction(self, #selector(loginDidTap))
        if let optionalBottomButton {
            optionalBottomButton.withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
        }
    }
    
  //MARK: - setupUI()
    
    private func setupUI(){
        
//        view.addSubview(contentView)
//        view.addSubview(newAccountButton)
//        view.addSubview(loginButton)
        
//        contentView.addSubview(logoImageView)
//        contentView.addSubview(loginTitle)
        contentView.addSubview(fogotPasswordButton)

        
        infoView.addSubview(fogotPasswordButton)
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
    }
    
  //MARK: - setupConstraints()
    
    private func setupConstraints(){
        

//        loginTitle.snp.makeConstraints { make in
//            make.bottom.equalTo(infoView.snp.top).inset(-16.0)
//            make.height.equalTo(24.0)
//            make.centerX.equalToSuperview()
//        }
        
//        newAccountButton.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
//            make.horizontalEdges.equalToSuperview().inset(20.0)
//            make.height.equalTo(20.0)
//            print(Self.self,#function, "ok")
//        }
        
//        loginButton.snp.makeConstraints { make in
//            make.bottom.equalTo(newAccountButton.snp.top).inset(-8.0)
//            make.horizontalEdges.equalToSuperview().inset(20.0)
//            make.height.equalTo(45.0)
//        }
        
   
        fogotPasswordButton.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(16.0)
            make.height.equalTo(17.0)
            print(Self.self,#function, "ok")
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
            make.bottom.equalTo(passwordTextField.snp.top).inset(-16.0)
            print(Self.self,#function, "ok")
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalTo(fogotPasswordButton.snp.top).inset(-20.0)
            print(Self.self,#function, "ok")
        }
        
    }
    
    //MARK: - Tap handlers
    
    @objc private func loginDidTap(){
        print(Self.self,#function, "ok")
        viewModel.loginDidTap(email: emailTextField.text, password: passwordTextField.text)
    }

    @objc private func forgotPasswordDidTap(){
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
}
