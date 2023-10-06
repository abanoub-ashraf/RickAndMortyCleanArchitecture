//
//  ItemHomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 29/09/2023.
//

import Foundation

struct ItemHomeMenuViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        self.menuItem.title.capitalized
    }
    
    var imageName: String {
        self.menuItem.title
    }
}
