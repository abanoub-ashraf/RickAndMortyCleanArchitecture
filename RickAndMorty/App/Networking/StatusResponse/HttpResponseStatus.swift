//
//  HttpResponseStatus.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 06/10/2023.
//

import Foundation

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
