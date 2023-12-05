//
//  OnboardFirstStepVC.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardFirstStepViewModelProtocol {
    func nextDidTap()
}

final class OnboardingFirstStepVC: UIViewController {
    
    private var viewModel: OnboardFirstStepViewModelProtocol
    
    private lazy var nextButton: UIButton =
        .yellowRoudedButton("next".localized)
        .withAction(viewModel, #selector(OnboardFirstStepViewModelProtocol.nextDidTap))
    
    init(viewModel: OnboardFirstStepViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
       // bind()
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
        view.addSubview(nextButton)
    }
    private func setupConstraints(){
        nextButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
        }
    }
}

