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

final class RegisterVC: UIViewController {
    private lazy var contentView: UIView = .contentView()
    
    private lazy var logoContainer: UIView = UIView()

    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var registerTitle: UILabel =
        .mainTitleLabel("nice_to_meet_you".localized)
    
    private lazy var registerButton: UIButton =
        .yellowRoudedButton("register".localized)
        .withAction(self, #selector(registerDidTap))
    private lazy var haveAccountButton: UIButton =
        .underlineYellowButton("have_account_btn".localized)
        .withAction(presenter, #selector(RegisterPresenterProtocol.haveAccountDidTap))
    private lazy var infoView:  UIView =
        .infoView()
    
    
    
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
    private lazy var repeatPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "repeat_password".localized
        textField.placeholder = "enter_password_again".localized
        return textField
    }()
    
        
    
    private var presenter: RegisterPresenterProtocol
    
    
    init(presenter: RegisterPresenterProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
   //     bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
//    private func bind() {
//        viewModel.catchEmailError = { errorText in
//            self.emailTextField.errorText = errorText
//        }
//
//        viewModel.catchPasswordError = {
//            self.passwordTextField.text = $0}
//    }
    
    //MARK: - setupUI()
      
      private func setupUI(){
          view.backgroundColor = .appBlack
          
          view.addSubview(contentView)
          view.addSubview(haveAccountButton)
          view.addSubview(registerButton)
          
          contentView.addSubview(logoContainer)
          contentView.addSubview(registerTitle)
          //contentView.addSubview(fogotPasswordButton)
          contentView.addSubview(infoView)
          
          logoContainer.addSubview(logoImageView)
          
          
          infoView.addSubview(emailTextField)
          infoView.addSubview(passwordTextField)
          infoView.addSubview(repeatPasswordTextField)
          
      }
      
    //MARK: - setupConstraints()
      
      private func setupConstraints(){
          
          contentView.snp.makeConstraints { make in
              make.horizontalEdges.equalToSuperview()
              make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
              make.bottom.equalTo(registerButton.snp.centerY)
          }
          
          logoContainer.snp.makeConstraints { make in
              make.top.horizontalEdges.equalToSuperview()
              make.bottom.equalTo(registerTitle.snp.top)
          }
          
          logoImageView.snp.makeConstraints { make in
              make.center.equalToSuperview()
              make.size.equalTo(96.0)
          }
          
          registerTitle.snp.makeConstraints { make in
              make.bottom.equalTo(infoView.snp.top).inset(-16.0)
              make.height.equalTo(24.0)
              make.centerX.equalToSuperview()
          }
          
          haveAccountButton.snp.makeConstraints { make in
              make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
              make.horizontalEdges.equalToSuperview().inset(20.0)
              make.height.equalTo(20.0)
          }
          
          registerButton.snp.makeConstraints { make in
              make.bottom.equalTo(haveAccountButton.snp.top).inset(-8.0)
              make.horizontalEdges.equalToSuperview().inset(20.0)
              make.height.equalTo(45.0)
          }
          
          infoView.snp.makeConstraints { make in
              make.centerY.equalToSuperview()
              make.horizontalEdges.equalToSuperview().inset(16.0)
             // make.height.equalTo(200.0)
          }
          
//          fogotPasswordButton.snp.makeConstraints { make in
//              make.bottom.left.equalToSuperview().inset(16.0)
//              make.height.equalTo(17.0)
//          }
//
          emailTextField.snp.makeConstraints { make in
              make.horizontalEdges.top.equalToSuperview().inset(16.0)
              make.bottom.equalTo(passwordTextField.snp.top).inset(-16.0)
          }

          passwordTextField.snp.makeConstraints { make in
              make.horizontalEdges.equalToSuperview().inset(16.0)
              make.bottom.equalTo(repeatPasswordTextField.snp.top).inset(-20.0)
          }
          
          repeatPasswordTextField.snp.makeConstraints { make in
              make.bottom.horizontalEdges.equalToSuperview().inset(16.0)
           //   make.bottom.equalToSuperview().inset(16.0)
          }
          
      }
      
      //MARK: - Tap handlers
      
    
    @objc private func registerDidTap() {
        print(Self.self, #function)
        presenter.registerDidTap(email: emailTextField.text,                                                    password: passwordTextField.text,
                                 repeatPassword: repeatPasswordTextField.text)
   }
}

extension RegisterVC: RegisterPresenterDelegate {

    func setEmailError(error: String?) {
        emailTextField.errorText = error
    }
    
    func setPasswordError(error: String?) {
        passwordTextField.errorText = error
    }
    
    func setRepeatPasswordError(error: String?) {
        repeatPasswordTextField.errorText = error
    }
    
    func keyboardFrameChanged(_ frame: CGRect) {
        print(frame)
        let maxY = infoView.frame.maxY + 16.0
        let keybordY = frame.minY
       // print("maxY =", maxY,", keyboardY =", keybordY)
        if maxY > keybordY {
            let diff = maxY - keybordY
            UIView.animate(withDuration: 0.25) {
                self.infoView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(-diff)
                }
                self.view.layoutIfNeeded()
            }
//            infoView.snp.updateConstraints { make in
//                make.centerY.equalToSuperview().offset(-diff)
            }
        }
    }
    

