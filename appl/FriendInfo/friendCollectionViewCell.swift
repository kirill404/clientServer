//
//  friendCollectionViewCell.swift
//  views
//
//  Created by Кирилл Пучков on 08.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

class friendCollectionViewCell: UICollectionViewCell {
    var add: Bool = true
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var button: LikeButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MyTapImage)))
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MyTapLike)))
    }
    
    @objc private func MyTapImage() {
        //print("nynydbfgbgf")
        let height = self.friendImage.frame.height
        let width = self.friendImage.frame.width
        self.friendImage.frame.size = CGSize(width: width - 90, height: height - 90)        
        UIView.animate(withDuration: 1,
                       delay: 0.1,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.friendImage.frame.size = CGSize(width: width, height: height)
        })
    }
    
    @objc private func MyTapLike() {
        let rotateTransform = CGAffineTransform(rotationAngle: CGFloat.pi) // Rotation
        let rotateTransform2 = CGAffineTransform(rotationAngle: CGFloat.pi * 2 ) // Rotation
        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.likeLabel.transform = rotateTransform
        }) { _ in
            self.likeLabel.text = String(Int(self.likeLabel.text!)! + 1)
        }
        UIView.animate(withDuration: 1, delay: 0.8, animations: {
            self.likeLabel.transform = rotateTransform2
        })
    }

    
    @IBAction func share(_ sender: Any) {
        let items = [friendImage.image]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        topViewController().present(ac, animated: true)
    }
    
    @IBAction func like(_ sender: Any) {
        if ( add ) {
            likeLabel.text = "568"
            likeLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            add = false
        }
        else {
            likeLabel.text = "567"
            likeLabel.textColor = #colorLiteral(red: 0.1333333333, green: 0.5058823529, blue: 0.9647058824, alpha: 1)
            add = true
        }
    }
    
    func topViewController()-> UIViewController{
        var topViewController:UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        
        while ((topViewController.presentedViewController) != nil) {
            topViewController = topViewController.presentedViewController!;
        }
        
        return topViewController
    }
    
    
    
}

