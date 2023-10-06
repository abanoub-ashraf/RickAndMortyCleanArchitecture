//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 29/09/2023.
//

import Foundation

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
