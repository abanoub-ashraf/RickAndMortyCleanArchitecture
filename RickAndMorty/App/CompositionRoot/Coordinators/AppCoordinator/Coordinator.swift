//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 28/09/2023.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
