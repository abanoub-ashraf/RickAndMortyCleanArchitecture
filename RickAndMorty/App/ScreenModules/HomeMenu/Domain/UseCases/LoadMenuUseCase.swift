//
//  LoadMenuUseCase.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 29/09/2023.
//

import Foundation

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await self.menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
