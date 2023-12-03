//
//  OnboardSecondStepAssembler.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 3.12.23.
//

import UIKit

final class OnboardSecondStepAssembler {
    private init() {}
    
    static func make(_ coordinator: OnboardSecondStepCoordinatorProtocol) -> UIViewController {
        let vm = OnboardSecondStepVM(coordinator: coordinator)
        return OnboardSecondStepVC(viewModel: vm)
    }
}

