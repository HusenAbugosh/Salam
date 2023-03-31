//
//  UserTBVCell.swift
//  Salam
//
//  Created by Husen Abughosh on 01/04/2022.
//

import UIKit


class UserTBVCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var laUsername: UILabel!
    @IBOutlet weak var laBio: UILabel!




    override func awakeFromNib() {
        super.awakeFromNib()

        imgView.layer.cornerRadius = 25
        imgView.layer.shadowColor = UIColor.darkGray.cgColor
        imgView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        imgView.layer.shadowRadius = 15
        imgView.layer.shadowOpacity = 0.8

        profileIMG.layer.cornerRadius = 25
        profileIMG.clipsToBounds = true


    }
    
    func loadData(_ user: User) {
        self.laUsername.text = user.username
        self.laBio.text = user.status
        self.profileIMG.loadImage(user.profileImageUrl)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
