//
//  MenuRepositoriesImp.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 29/09/2023.
//

import Foundation

struct MenuRepositoriesImp: MenuRepository {
    let apiClientService: ApiClientService
    let urlList: String
    
    func fetchMenuData() async throws -> [MenuItem] {
        let url = URL(string: urlList)
        ///
        /// - the web service gives dto object always
        /// - we need to convert it into entity
        ///
        return try await self.apiClientService.request(url: url, type: MenuDTO.self).toDomain()
    }
}
