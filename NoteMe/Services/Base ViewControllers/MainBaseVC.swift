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
    
    lazy var mainButton: UIButton =
        .yellowRoudedButton("button_name_error".localized)
      //  .withAction(self, #selector(mainDidTap))
    
      var optionalBottomButton: UIButton? //=
       // .underlineYellowButton("optional_button_name_error".localized)
      //  .withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
    
    
    
    
  //  private var viewModel: MainViewModelProtocol
    
//    init(viewModel: MainViewModelProtocol){
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//        
//    }
    init(mainButtonTitle: String,
         optionalBottomBottonTitle: String?){
        super.init(nibName: nil, bundle: nil)
        print(mainButtonTitle, optionalBottomBottonTitle)
        self.mainButton.setTitle(mainButtonTitle, for: .normal)
        if let optionalBottomBottonTitle {
            self.optionalBottomButton = .underlineYellowButton(optionalBottomBottonTitle)
        }
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
        if let optionalBottomButton
        {
            view.addSubview(optionalBottomButton)
        }
    }
    
  //MARK: - setupConstraints()
    
    private func setupConstraints(){
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(mainButton.snp.centerY)
            
        }
        
        mainButton.snp.makeConstraints { make in
            if let optionalBottomButton {
                make.bottom.equalTo(optionalBottomButton.snp.top).inset(-8.0)}
            else {
                make.bottom.equalToSuperview().inset(8.0)
            }
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
        
        if let optionalBottomButton {
            optionalBottomButton.snp.makeConstraints { make in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8.0)
                make.horizontalEdges.equalToSuperview().inset(20.0)
                make.height.equalTo(20.0)
            }
        }
       
        
        
    }
    
    //MARK: - Tap handlers
    
    @objc private func mainDidTap(){ }

    @objc private func optionalBottomDidTap(){ }
}

