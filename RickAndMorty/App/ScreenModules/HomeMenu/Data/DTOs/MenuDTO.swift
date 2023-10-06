//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 06/10/2023.
//

import Foundation

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {}
