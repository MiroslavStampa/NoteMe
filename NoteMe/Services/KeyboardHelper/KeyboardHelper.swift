//
//  KeyboardHelper.swift
//  NoteMe
//
//  Created by Miroslav Martynovich on 14.11.23.
//

import UIKit

final class KeyboardHelper {
    
    typealias KeyboardHeightHandler = (CGFloat) -> Void
    
    private var willShow: KeyboardHeightHandler?
    private var didShow: KeyboardHeightHandler?
    private var willHide: KeyboardHeightHandler?
    private var didHide: KeyboardHeightHandler?
    
    init() {
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    private func addObservers() {
        //       let center = NotificationCenter.default
        //        center.addObserver(self,
        //                           selector: #selector,
        //                           name: UIResponder.keyboardWillShowNotification,
        //                           object: nil)
        //    }center.addObserver(self,
        //                           selector: <#T##Selector#>,
        //                           name: UIResponder.keyboardWillHideNotification,
        //                           object: nil)
        //    }center.addObserver(self,
        //                           selector: <#T##Selector#>,
        //                           name: UIResponder.keyboardWillShowNotification,
        //                           object: nil)
        //    }center.addObserver(self,
        //                           selector: <#T##Selector#>,
        //                           name: UIResponder.keyboardWillShowNotification,
        //                           object: nil)
    }
    
    private func removeObservers() {
        let center = NotificationCenter.default
        center.removeObserver(self,
                              name: UIResponder.keyboardWillShowNotification,
                              object: nil)
    }
    private func height(from notification: Notification) -> CGFloat {
        guard
            let userInfo = notification.userInfo,
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else {return .zero}
        
        return frame.height
    }
    
    private func keyboardWillShow(_ notification: Notification){
        willShow?(height(from: notification))
    }
    private func keyboardDidShow(_ notification: Notification){
        willShow?(height(from: notification))
    }
    private func keyboardWillHide(_ notification: Notification){
        willShow?(height(from: notification))
    }
    private func keyboardDidHide(_ notification: Notification){
        willShow?(height(from: notification))
    }
    @discardableResult
    func onWillShow(_ handler: KeyboardHeightHandler) -> Self {
        //willShow = handler
        return self
    }
    
    @discardableResult
    func onDidShow(_ handler: KeyboardHeightHandler) -> Self {
        //willShow = handler
        return self
    }
    
    @discardableResult
    func onWillHide(_ handler: KeyboardHeightHandler) -> Self {
        //willShow = handler
        return self
    }
    
    @discardableResult
    func onDidHide(_ handler: KeyboardHeightHandler) -> Self {
        //willShow = handler
        return self
    }
}
