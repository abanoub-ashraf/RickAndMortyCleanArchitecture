//
//  HomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 29/09/2023.
//

import Foundation
import Combine

protocol HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemsCount: Int { get }
    
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel
    func getMenuItem(indexPath: IndexPath) -> MenuItem
}

final class HomeMenuViewModelImp: HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var menuItemsCount: Int {
        self.menuItems.count
    }
    
    private let loadMenuUseCase: LoadMenuUseCase
    private var menuItems: [MenuItem] = []
    
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCase) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }
    
    func viewDidLoad() {
        self.state.send(.loading)
        
        Task {
            let result = await self.loadMenuUseCase.execute()
            self.updateUI(result: result)
        }
    }
    
    private func updateUI(result: Result<[MenuItem], Error>) {
        switch result {
            case .success(let menuItems):
                self.menuItems = menuItems
                self.state.send(.success)
                
            case .failure(let error):
                self.state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel {
        let menuItem = self.menuItems[indexPath.row]
        return ItemHomeMenuViewModel(menuItem: menuItem)
    }
    
    func getMenuItem(indexPath: IndexPath) -> MenuItem {
        return self.menuItems[indexPath.row]
    }
}
