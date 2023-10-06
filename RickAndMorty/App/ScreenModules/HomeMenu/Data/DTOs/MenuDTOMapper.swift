//
//  MenuDTOMapper.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 06/10/2023.
//

import Foundation

extension MenuDTO {
    ///
    /// the dto coming from the repository of the data layer has to be converted into the entitiy in the domain layer
    ///
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
