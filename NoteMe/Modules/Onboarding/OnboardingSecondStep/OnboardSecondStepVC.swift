//
//  OnboardSecondStepVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 28.11.23.
//

import UIKit

@objc protocol OnboardSecondStepViewModelProtocol {
    @objc func doneDidTap()
    func dismissedByUser()
}

final class OnboardSecondStepVC: MainBaseVC {
    
    private var viewModel: OnboardSecondStepViewModelProtocol
    
//    private lazy var doneButton: UIButton =
//        .yellowRoudedButton("done".localized)
//        .withAction(viewModel,
//                    #selector(OnboardSecondStepViewModelProtocol.doneDidTap))
//    
    init(viewModel: OnboardSecondStepViewModelProtocol) {
        self.viewModel = viewModel
        super.init(mainButtonTitle: "done".localized, optionalBottomBottonTitle: nil)
        bind()
       // super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupUI()
        //setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.dismissedByUser()
    }
    
    private func bind(){
        mainButton.withAction(viewModel,
                              #selector(OnboardSecondStepViewModelProtocol.doneDidTap))
    }
    private func setupUI(){
        view.backgroundColor = .appGray
     //   view.addSubview(doneButton)
    //}
//    private func setupConstraints(){
//        doneButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.horizontalEdges.equalToSuperview().inset(20.0)
//            make.height.equalTo(45.0)
//        }
    }
    
    
    
}
