//
//  FriendsTableViewController.swift
//  views
//
//  Created by Кирилл Петров on 07.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit



class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var nameFriend: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = filtered( data: FriendsData)
        //tableView.register(HeaderFoterView.self, forHeaderFooterViewReuseIdentifier: "HeaderFoterView")
        tableView.register(UINib(nibName: "SectionForFriends", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "SectionForFriends")
        navigationController?.delegate = self
    }
    
    func filtered ( data: [Person]) -> [ [Person] ] {
        var dataReturn: [ [Person] ] = []
        for friend in data {
            let aa = friend.name.first
            if let index = firstChar.firstIndex(of: aa!) {
                //print("index \(index)")
                dataReturn[index].append(friend)
            } else {
                firstChar.append(aa!)
                dataReturn.append([friend])
            }
        }
        firstChar.sort()
        dataReturn.sort(by: { $0[0].lastName < $1[0].lastName } )
        return dataReturn
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if ( searchText.isEmpty ) {
            firstChar.removeAll()
            filteredData.removeAll()
            filteredData = filtered(data: FriendsData)
        }
        else {
            firstChar.removeAll()
            filteredData.removeAll()
            let ddd = FriendsData.filter( { ( item: Person) -> Bool in
                return item.name.range(of: searchText, options: .literal, range: nil, locale: nil) != nil
            } )
            //print("ddd: \(ddd)")
            filteredData = filtered(data: ddd)
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! friendsTableViewCell
        cell.nameFriend.text = filteredData[indexPath.section][indexPath.row].name
        cell.iconAvatar.image = UIImage(named: filteredData[indexPath.section][indexPath.row].imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionForFriends") as! HeaderFoterView
        if ( tableView.numberOfSections == 1) {
            header.Headers.text = "Лучшие совпадения"
        } else {
            header.Headers.text = String( firstChar[section])
        }
        return header
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "fotoCollectionSegue" else {
            return
        }
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        let friendFotoController = segue.destination as! FriendCollectionViewController
        friendFotoController.person = filteredData[indexPath.section][indexPath.row]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    
    // MARK: - Private instance methods
    
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//
//    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//        filteredCandies = candies.filter({( candy : Candy) -> Bool in
//            return candy.name.lowercased().contains(searchText.lowercased())
//        })
//
//        tableView.reloadData()
//    }

}

extension FriendsTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        //guard let text = searchController.searchBar.text else { return }
        //print(searchController.searchBar.text)
    }
}

extension FriendsTableViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return AnimatedTransitioningForPush()
        }
        else if operation == .pop {
            return AnimateTransition()
        }
        return nil
    }
}


