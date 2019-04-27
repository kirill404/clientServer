//
//  friendCollectionViewController.swift
//  views
//
//  Created by Кирилл Пучков on 08.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit


class FriendCollectionViewController: UICollectionViewController {
    var friendData: String?
    var indexImage: Int?
    var person: Person?
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        //print("Asd")
        //было бы енеплохо увидеть реализацию сдесь!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendInfoCell", for: indexPath) as! friendCollectionViewCell
        cell.friendImage.image = UIImage(named: (person?.imageName)!)
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: [],
//                       animations: {
//                        self.indexImage.frame.origin.y -= 100
//        })
//
//    }


    


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        cell.alpha = 0
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1,
                       options: [], animations: {
                        cell.transform = .identity
                        cell.alpha = 1
        })
    }
}

