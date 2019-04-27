//
//  Data.swift
//  views
//
//  Created by Кирилл Пучков on 17.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import Foundation

struct Person: Equatable {
    let name: String
    let lastName: String
    let imageName: String
}

var filteredData: [ [Person] ] = []
var firstChar: [Character] = []

var FriendsData: [Person] = [
    Person(name: "Valera", lastName: "Pitrov", imageName: "image_val"),
    Person(name: "Valera", lastName: "Petrov", imageName: "image_val"),
    Person(name: "Anna", lastName: "Andreeva", imageName: "image_anna"),
    Person(name: "Angela", lastName: "Andronova", imageName: "image_anna"),
    Person(name: "Boris", lastName: "Ivanov", imageName: "image_anton"),
    Person(name: "Kirill", lastName: "Oplov", imageName: "image_kir"),
]








