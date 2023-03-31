//
//  testVC.swift
//  Salam
//
//  Created by Husen Abughosh on 02/04/2022.
//

import UIKit

class testVC: UIViewController {
    
    
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgView.layer.cornerRadius = 25
        imgView.layer.shadowColor = UIColor.darkGray.cgColor
        imgView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        imgView.layer.shadowRadius = 25.0
        imgView.layer.shadowOpacity = 0.3
        
        profileImg.layer.cornerRadius = 25
        profileImg.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
