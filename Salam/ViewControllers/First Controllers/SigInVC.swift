//
//  SigInVC.swift
//  Salam
//
//  Created by Husen Abughosh on 12/01/2022.
//

import UIKit
import ProgressHUD

class SigInVC: UIViewController {
    
    
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signInBTN: UIButton!
    @IBOutlet weak var signUpBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        signInBTN.addTarget(self, action: #selector(self.SkipBtn(sender:)), for: .touchUpInside)
    }
    
    
    
    func setupUI()  {
        
        
   // TEXTFIELD UI DESGIN :
        
        // email text filed:
        emailView.layer.borderWidth = 1.25
        emailView.layer.borderColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
        emailView.layer.cornerRadius = 4
        emailView.clipsToBounds = true
        emailTxtField.borderStyle = .none
        
        let emailplaceholderAttr = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        
        emailTxtField.attributedPlaceholder = emailplaceholderAttr
        emailTxtField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
        
        // paswword text field:
        passwordView.layer.borderWidth = 1.25
        passwordView.layer.borderColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
        passwordView.layer.cornerRadius = 4
        passwordView.clipsToBounds = true
        passwordTxtField.borderStyle = .none
      
        
        let passplaceholderAttr  = NSAttributedString(string: "Password (8+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        
        passwordTxtField.attributedPlaceholder = passplaceholderAttr
        passwordTxtField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
        
        
        
        
    // Buttons UI DESGIN :
            
            // signUp button :
            signInBTN.setTitle("Sign In 🤙🏽", for: UIControl.State.normal)
            signInBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            signInBTN.backgroundColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
            signInBTN.layer.cornerRadius = 5
            signInBTN.clipsToBounds = true
            signInBTN.setTitleColor(.white, for: UIControl.State.normal)
            
            // signIn button :
            let attributedText = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                                                              NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)                                                                      ])
            let attributedSubText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
                                                                                              NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)                                                                    ])
            attributedText.append(attributedSubText)
            signUpBTN.setAttributedTitle(attributedText, for: UIControl.State.normal)
       
      }
    
    
    
    
    
    
    
    
    @IBAction func buSignIn(_ sender: Any) {
        
        self.validateFields()
        self.signInMthd {
             // switch View
            (UIApplication.shared.delegate as! AppDelegate).configureIntialViewController()
        } onError: { errorMessage in
            ProgressHUD.showError(errorMessage )
        }

        self.view.endEditing(true)

    }
        
         
    }
    
    
    
    
    
        
        
        
        
        
        
        
        
        
        

 






extension SigInVC {
    
    
    
    
    
    // signInmethod :
    func signInMthd( onSuccess: @escaping() -> Void, onError:  @escaping(_ errorMessage: String) -> Void) {
  
        // to create new User (signUP METHOD)
        ProgressHUD.show()
        Api.User.sigIn(email: self.emailTxtField.text! , password: self.passwordTxtField.text!) {
            onSuccess()
            ProgressHUD.dismiss()
        } onError: { errorMessage in
            onError(errorMessage)
        }

        
    }
    
    
    
    func validateFields() {
    
        
        
        
        guard let email = self.emailTxtField.text, !email.isEmpty  else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        
        
    guard let password = self.passwordTxtField.text, !password.isEmpty  else {
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
  
    



