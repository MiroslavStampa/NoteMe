//
//  OnboardSecondStepCoordinator.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 3.12.23.
//

import UIKit

final class OnboardSecondStepCoordinator: Coordinator {
    
    var onDismissedByUser: ((Coordinator) -> Void)?
    
    override func start() -> UIViewController {
        return OnboardSecondStepAssembler.make(self)
    }
}
extension OnboardSecondStepCoordinator: OnboardSecondStepCoordinatorProtocol {
    func dismissedByUser() {
        onDismissedByUser?(self)
    }
}
