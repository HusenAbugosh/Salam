//
//  ForgetPassVC.swift
//  Salam
//
//  Created by Husen Abughosh on 13/01/2022.
//

import UIKit
import ProgressHUD


class ForgetPassVC: UIViewController {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var RestPassBTN: UIButton!
    
    
    



    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
       RestPassBTN.addTarget(self, action: #selector(self.SkipBtn(sender:)), for: .touchUpInside)
    }
    
    
    
    
    
    
    
    func setupUI() {
        
        
    // TEXT FILED UI DESGIN:
        
        // paswword text field:
        emailView.layer.borderWidth = 1.25
        emailView.layer.borderColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
        emailView.layer.cornerRadius = 4
        emailView.clipsToBounds = true
        passwordTxtField.borderStyle = .none
      
        
        let passplaceholderAttr  = NSAttributedString(string: "Your Email Address ", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        
        passwordTxtField.attributedPlaceholder = passplaceholderAttr
        passwordTxtField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
        
        
        
        
    // Buttons UI DESGIN :
            
            // signUp button :
        RestPassBTN.setTitle("RESET MY PASSWORD 😬", for: UIControl.State.normal)
        RestPassBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        RestPassBTN.backgroundColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
        RestPassBTN.layer.cornerRadius = 5
        RestPassBTN.clipsToBounds = true
        RestPassBTN.setTitleColor(.white, for: UIControl.State.normal)
            
       
    }
    
    

    
    
    
    
    
    @IBAction func buClose(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    @IBAction func buRestPass(_ sender: Any) {
         
        
      
        
        guard let email = passwordTxtField.text, email != "" else {
            ProgressHUD.showError("Please enter an email add ress for password Rest")
            return
        }
        
        Api.User.restPassword(email: email) {
            self.view.endEditing(true)
            ProgressHUD.showSuccess("We have just sent you a password rest email, please check your inbox and follow the instructions to rest the password")
            self.navigationController?.popViewController(animated: true)
        } onError: { errorMessage in
            ProgressHUD.showError(errorMessage)
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
