//
//  SignUpEXT.swift
//  Salam
//
//  Created by Husen Abughosh on 05/02/2022.
//

import Foundation
import UIKit
import ProgressHUD
import Firebase

extension SignUpVC {
    
    
    
    // signup method :
    func signUpMthd(onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void) {
  
        // to create new User (signUP METHOD)
        ProgressHUD.show()
        Api.User.SignUp(withUserName: userNameTxtField.text!
                        , email: self.emailTxtField.text!,
                        password: self.passwordField.text!
                        , image: self.image) {
            onSuccess()
            ProgressHUD.dismiss()
        } onError: { errorMessage in
            onError(errorMessage)
        }

    }
    
    
    
    

    
    
    
    func validateFields() {
    
        
        guard let username = self.userNameTxtField.text, !username.isEmpty  else {
            ProgressHUD.showError("Please enter an userame")
            return
        }
        
        
        guard let email = self.emailTxtField.text, !email.isEmpty  else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        
        
        guard let password = self.passwordField .text, !password.isEmpty  else {
            ProgressHUD.showError("please enter a password")
            return
        }
        

        
      
        
      
    }
    
    
    
    
    //  to make  button animation
    @objc func SkipBtn(sender: UIButton) {
        self.animateView(sender)
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    fileprivate func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
