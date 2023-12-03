//
//  OnboardSecondStepVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 28.11.23.
//

import UIKit

@objc protocol OnboardSecondStepViewModelProtocol {
    func onDidTap()
}

final class OnboardSecondStepVC: UIViewController {
    
    private var viewModel: OnboardSecondStepViewModelProtocol
    
    private lazy var doneButton: UIButton =
        .yellowRoudedButton("done".localized)
        .withAction(viewModel, #selector(OnboardSecondStepViewModelProtocol.onDidTap))
    
    init(viewModel: OnboardSecondStepViewModelProtocol) {
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
    
    private func setupUI(){
        view.backgroundColor = .appGray
        view.addSubview(doneButton)
    }
    private func setupConstraints(){
        doneButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
    }
    
    
    
}
