//
//  Reusable.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 28/09/2023.
//

protocol Reusable {}

extension Reusable {
    static var reusableIdentifier: String {
        String(describing: self)
    }
}
