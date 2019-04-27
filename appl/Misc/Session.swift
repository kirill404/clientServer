//
//  Session.swift
//  views
//
//  Created by Кирилл Пучков on 27/04/2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import Foundation

class Session {
    
    private init() { }
    
    static let instance = Session()
    
    var token: String = "" //для хранения токена в VK
    var userId: Int = 0 //для хранения идентификатора пользователя ВК.
}
