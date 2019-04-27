//
//  Avatar.swift
//  views
//
//  Created by Кирилл Пучков on 14.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

@IBDesignable class Avatar: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    private var imageView: UIImageView!
    
    override func awakeFromNib() {
        
        imageView = UIImageView(frame: bounds)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.gray.cgColor
        //imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        addSubview(imageView)
        
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.cornerRadius = layer.frame.width / 2
        
    }
    
}
