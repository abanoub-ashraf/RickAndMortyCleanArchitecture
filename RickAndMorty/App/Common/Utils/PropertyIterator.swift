//
//  PropertyIterator.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 06/10/2023.
//

import Foundation

protocol PropertyIterator {}

extension PropertyIterator {
    ///
    /// i used this to convert the MenuDTO object to a dictionary
    ///
    func dictionaryProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        
        return dictionary
    }
}
