//
//  friendsTableViewCell.swift
//  views
//
//  Created by Кирилл Петров on 07.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

class friendsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconAvatar: Avatar!
    @IBOutlet weak var nameFriend: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
