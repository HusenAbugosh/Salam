//
//  PeopleTBVC.swift
//  Salam
//
//  Created by Husen Abughosh on 01/04/2022.
//

import UIKit

class PeopleTBVC: UITableViewController, UISearchResultsUpdating {

    var users : [User] = []
    var searchContoller: UISearchController = UISearchController(searchResultsController: nil)
    var searchResults: [User] = []
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setUpSearchBarController()
        setUpNavigationBar()
        observeUsers()
        

    }
    
    
    func setUpSearchBarController(){
        
        searchContoller.searchResultsUpdater = self
        searchContoller.dimsBackgroundDuringPresentation = true
        searchContoller.searchBar.placeholder = "Search users... "
        searchContoller.searchBar.barTintColor = UIColor.white
        searchContoller.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchContoller
        
    }
    
    
    
    func setUpNavigationBar() {
        navigationItem.title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    
    
    func observeUsers() {
        Api.User.observeUsers { user in
            self.users.append(user)
            self.tableView.reloadData()
        }
      }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == nil || searchController.searchBar.text!.isEmpty {
            view.endEditing(true)
        }else{
            let textLowercased = searchController.searchBar.text!.lowercased()
            filterContent(for: textLowercased)
        }
        tableView.reloadData()
    }
    
    
    func filterContent(for searchText: String) {
        searchResults = self.users.filter {
            return $0.username.lowercased().range(of: searchText) != nil
        }
    }
    


    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searchContoller.isActive {
//            return searchResults.count
//        }else{
//        return self.users.count
//        }
        return searchContoller.isActive ? searchResults.count : self.users.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIRE_CELL_USERS, for: indexPath) as! UserTBVCell

        let user =  searchContoller.isActive ?  searchResults[indexPath.row] : users[indexPath.row]
        cell.loadData(user)
        
        return cell
    }

    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
