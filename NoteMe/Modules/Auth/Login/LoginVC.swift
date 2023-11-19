//
//  LoginVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 24.10.23.
//

import UIKit
import SnapKit

@objc protocol LoginViewModelProtocol: AnyObject {
    var catchEmailError: ((String) -> Void)? { get set }
    var catchPasswordError: ((String) -> Void)? { get set }
    
    func loginDidTap(email: String?, password: String?)
    @objc func newAccountDidTap()
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
        .yellowRoudedButton("login".localized)
        .withAction(self, #selector(loginDidTap))
    
    private lazy var newAccountButton: UIButton =
        .underlineYellowButton("new_account".localized)
        .withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
    
    private lazy var fogotPasswordButton: UIButton =
        .underlineGrayButton("fogot_password".localized)
        .withAction(self, #selector(forgotPasswordDidTap))
    
    private lazy var infoView: UIView = {
       let view = UIView()
        view.cornerRadius = 5.0
        view.backgroundColor = .white
        return view
    }()
    
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
    
  //MARK: - setupUI()
    
    private func setupUI(){
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginButton)
        contentView.addSubview(newAccountButton)
        contentView.addSubview(fogotPasswordButton)
        contentView.addSubview(infoView)
        
        infoView.addSubview(fogotPasswordButton)
        infoView.addSubview(emailTextField)
        infoView.addSubview(passwordTextField)
    }
    
  //MARK: - setupConstraints()
    
    private func setupConstraints(){
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(loginButton.snp.centerY)
            
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(newAccountButton.snp.top).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16.0)
            //make.height.equalTo(200.0)
        }
        
        fogotPasswordButton.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(16.0)
            make.height.equalTo(17.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
            make.bottom.equalTo(fogotPasswordButton.snp.top).inset(-20.0)
        }
        
    }
    
    //MARK: - Tap handlers
    
    @objc private func loginDidTap(){
        viewModel.loginDidTap(email: emailTextField.text, password: nil)
    }
    
//    @objc private func newAccountDidTap(){
//        viewModel.newAccountDidTap()
//    }
    
    @objc private func forgotPasswordDidTap(){
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
}
