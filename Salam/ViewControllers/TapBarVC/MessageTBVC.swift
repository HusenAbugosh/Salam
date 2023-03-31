//
//  MessageTBVC.swift
//  Salam
//
//  Created by Husen Abughosh on 06/02/2022.
//

import UIKit

class MessageTBVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIRE_CELL_USERS, for: indexPath) as! UserTBVCell

        cell.textLabel?.text = "\(indexPath.row)"
        cell.laUsername.text = "husen abugosh"
        cell.laBio.text = "Salam"
        cell.profileIMG.image = UIImage(named: "photo3")

        return cell
    }
 
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    
    
    @IBAction func buLogout(_ sender: Any) {
        
        Api.User.logout()
        
    }
    
    
    
    
    

}
