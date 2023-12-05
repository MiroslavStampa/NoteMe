//
//  MainBaseVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 4.12.23.
//

import UIKit

import SnapKit

//protocol MainViewModelProtocol: AnyObject {
//    func mainDidTap()
//    func optionalDidTap()
//    var infoView: UIView { get set }
//}

class MainBaseVC: UIViewController {
    
    lazy var contentView: UIView =
        .contentView()
    
    
//    private lazy var logoImageView: UIImageView =
//        UIImageView(image: .General.logo)
    
//    private lazy var logoContainer: UIView = UIView()
//    
//    private lazy var mainTitle: UILabel =
//        .mainTitleLabel("main_error".localized)
    
    private lazy var mainButton: UIButton =
        .yellowRoudedButton("button_name_error".localized)
      //  .withAction(self, #selector(mainDidTap))
    
     lazy var optionalBottomButton: UIButton =
        .underlineYellowButton("optional_button_name_error".localized)
      //  .withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
    
    
    
    
  //  private var viewModel: MainViewModelProtocol
    
//    init(viewModel: MainViewModelProtocol){
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//        
//    }
    init(mainButtonTitle: String,
         optionalBottomBottonTitle: String){
        super.init(nibName: nil, bundle: nil)
        self.mainButton.titleLabel?.text = mainButtonTitle
        self.optionalBottomButton.titleLabel?.text = optionalBottomBottonTitle
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        print(Self.self,#function, "in mainVC")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
  //MARK: - setupUI()
    
    private func setupUI(){
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(mainButton)
        view.addSubview(optionalBottomButton)
        
//        contentView.addSubview(mainTitle)
//        contentView.addSubview(infoView)
        
//        logoContainer.addSubview(logoImageView)
        
    }
    
  //MARK: - setupConstraints()
    
    private func setupConstraints(){
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(mainButton.snp.centerY)
            
        }
        
//        logoContainer.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalToSuperview()
//            make.bottom.equalTo(mainTitle.snp.top)
//        }
//        
//        logoImageView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.size.equalTo(96.0)
//        }
        
//        mainTitle.snp.makeConstraints { make in
//            make.bottom.equalTo(infoView.snp.top).inset(-16.0)
//            make.height.equalTo(24.0)
//            make.centerX.equalToSuperview()
//        }
        
        optionalBottomButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalTo(optionalBottomButton.snp.top).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
//        infoView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.horizontalEdges.equalToSuperview().inset(16.0)
//            //make.height.equalTo(200.0)
//        }
        
       
        
    }
    
    //MARK: - Tap handlers
    
    @objc private func mainDidTap(){ }

    @objc private func optionalBottomDidTap(){ }
}

