//
//  ApiClientService.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 03/10/2023.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
