//
//  AuthVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 4.12.23.
//


import UIKit

import SnapKit

//protocol AuthViewModelProtocol: AnyObject {
//    func mainDidTap()
//    func optionalDidTap()
//    
//}

class AuthBaseVC: MainBaseVC {
    
    private lazy var logoImageView: UIImageView =
        UIImageView(image: .General.logo)
    
    private lazy var logoContainer: UIView = UIView()
    
    private lazy var mainTitle: UILabel =
        .mainTitleLabel("main_error".localized)
    
    lazy var infoView: UIView =
            .infoView()
    
//    private var viewModel: AuthViewModelProtocol
    
//    init(viewModel: AuthViewModelProtocol){
//        self.viewModel = viewModel
//        super.init(viewModel: viewModel as! MainViewModelProtocol)
//        
//    }
    init(mainButtonTitle: String,
         optionalBottomBottonTitle: String,
         name: String){
        super.init(mainButtonTitle: mainButtonTitle, optionalBottomBottonTitle: optionalBottomBottonTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        print(Self.self,#function, " in authVC")
        
    }
 
    
    
  //MARK: - setupUI()
    
    private func setupUI(){
        view.backgroundColor = .appBlack
        
        
        contentView.addSubview(mainTitle)
        contentView.addSubview(infoView)
        contentView.addSubview(logoContainer)
        
        logoContainer.addSubview(logoImageView)
        
    }
    
  //MARK: - setupConstraints()
    
    private func setupConstraints(){
        
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(mainTitle.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        mainTitle.snp.makeConstraints { make in
            make.bottom.equalTo(infoView.snp.top).inset(-16.0)
            make.height.equalTo(24.0)
            make.centerX.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16.0)
            //make.height.equalTo(200.0)
        }
        
       
        
    }
    
}

