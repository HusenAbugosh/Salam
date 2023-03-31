//
//  SignUpVC.swift
//  Salam
//
//  Created by Husen Abughosh on 12/01/2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import SwiftMessages
import ProgressHUD

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var fullNameView: UIView!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInBTN: UIButton!
    @IBOutlet weak var signUpBTN: UIButton!
    
    
    // VARIBALS
    var image: UIImage? = nil

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        coddingStuff()
        
        signUpBTN.addTarget(self, action: #selector(self.SkipBtn(sender:)), for: .touchUpInside)
        
//        guard  let  imageSelected = image else {
//        
//            ProgressHUD.showError("please choose your p rofile image")
//            signUpBTN.isEnabled = true
//            signUpBTN.backgroundColor = .black
//            
//            return
//        }

        
      
    }
    
    
    
    
    func setupUI() {
        
        
        // PROFILE IMAGE UI DESGIN :
          profileIMG.layer.cornerRadius = 50 
          profileIMG.layer.shadowRadius = 10
          profileIMG.layer.shadowColor = UIColor.black.cgColor
          profileIMG.layer.shadowOpacity = 1
          profileIMG.clipsToBounds = true
          profileIMG.isUserInteractionEnabled = true
          
       // TEXTFIELD UI DESGIN :
          
          // username text field :
          fullNameView.layer.borderWidth = 1.25
          fullNameView.layer.borderColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
          fullNameView.layer.cornerRadius = 4
          fullNameView.clipsToBounds = true
          userNameTxtField.borderStyle = .none
          
          let placeholderAttr = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
          
          userNameTxtField.attributedPlaceholder = placeholderAttr
          userNameTxtField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
          
          
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
          passwordField.borderStyle = .none
        
          
          let passplaceholderAttr  = NSAttributedString(string: "Password (8+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
          
          passwordField.attributedPlaceholder = passplaceholderAttr
          passwordField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
          
          
      // Buttons UI DESGIN :
          
          // signUp button :
          signUpBTN.setTitle("Sign Up 🤟🏽", for: UIControl.State.normal)
          signUpBTN.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          signUpBTN.backgroundColor = #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)
          signUpBTN.layer.cornerRadius = 5
          signUpBTN.clipsToBounds = true
          signUpBTN.layer.shadowRadius =  10 
          signUpBTN.setTitleColor(.white, for: UIControl.State.normal)
          
          // signIn button :
          let attributedText = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                                                            NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)                                                                      ])
          let attributedSubText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
                                                                                            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.1274266839, green: 0.157800287, blue: 0.3907095194, alpha: 1)                                                                    ])
          attributedText.append(attributedSubText)
          signInBTN.setAttributedTitle(attributedText, for: UIControl.State.normal)
        
     
    }
    
    
    
    
    func coddingStuff() {
        
     // setup imagePicker
        
        profileIMG.isUserInteractionEnabled =  true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        profileIMG.addGestureRecognizer(tapGesture)
        
        
        // keyBoard Dissmiss:
        
           func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
               self.view.endEditing(true)
           }
 
    }
    
    
    
    
    @objc func presentPicker() {
         
        let picker = UIImagePickerController()
        picker.allowsEditing =  true
        picker.delegate =   self 
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
         
     }
    
    

    
    
    
    
    @IBAction func buClose(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func buSignUp(_ sender: Any) {
        
        self.validateFields()
        self.signUpMthd {
             // switch View:
            (UIApplication.shared.delegate as! AppDelegate).configureIntialViewController()
        } onError: { errorMessage in
            ProgressHUD.showError(errorMessage )
        }

        self.view.endEditing(true)

    }
    
    

}






extension SignUpVC: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imageSelected  = info[UIImagePickerController.InfoKey.editedImage] as?  UIImage {
            
            image = imageSelected
            profileIMG.image = imageSelected
        }
        
        
        if let originalImage  = info[UIImagePickerController.InfoKey.originalImage] as?  UIImage {
            
            image = originalImage
            profileIMG.image = originalImage
        }
        
        picker.dismiss(animated: true, completion: nil )
        
        
        
        
    }
     
}





