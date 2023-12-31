//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 28/09/2023.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule() -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        
        let menuRepository = MenuRepositoriesImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        
        let state = PassthroughSubject<StateController, Never>()
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        
        let homeMenuController = HomeMenuController(viewModel: homeMenuViewModel, layout: makeLayout())
        homeMenuController.title = "Rick And Morty"
        return homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width - 20) / 2
        let layoutHeight = (UIScreen.main.bounds.width - 20) / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
}
