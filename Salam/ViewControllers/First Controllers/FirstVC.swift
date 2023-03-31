//
//  ViewController.swift
//  Salam
//
//  Created by Husen Abughosh on 23/12/2021.
//

import UIKit

class FirstVC: UIViewController {
    
    
     
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var ORLBL: UILabel!
    @IBOutlet weak var FBSBTN: UIButton!
    @IBOutlet weak var GSBTN: UIButton!
    @IBOutlet weak var CreateNewAccBTN: UIButton!
    @IBOutlet weak var TermLBL: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
       
    }
    
    
    
    
    func setupUI() {
        
        
        // to make  TermsOfService LBl:
        let attributedTermText  = NSMutableAttributedString(string: "By clicking 'Create a new account' you agree to our    ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        
        
        let attributedSubTermText =  NSMutableAttributedString(string: "Terms of Service.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        
        attributedTermText.append(attributedSubTermText)
        
        TermLBL.attributedText = attributedTermText
        TermLBL.numberOfLines = 0
        
        
        
        // to  customize BTNS:
        FBSBTN.setImage(UIImage(systemName: "facebook"), for: UIControl.State.normal)
        FBSBTN.imageView?.contentMode = .scaleAspectFit
        FBSBTN.imageView?.sizeToFit()
        FBSBTN.tintColor = .white
        FBSBTN.configuration?.titlePadding = 10
        FBSBTN.configuration?.imagePadding = 30
        FBSBTN.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        
//        GSBTN.setImage(UIImage(named: "icon-google"), for: UIControl.State.normal)
        GSBTN.imageView?.contentMode = .scaleAspectFit
        GSBTN.tintColor = .white
        GSBTN.configuration?.titlePadding = 10
        GSBTN.configuration?.imagePadding = 20
        GSBTN.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        
        
        
        
        
        
        
        
         
    }


}

