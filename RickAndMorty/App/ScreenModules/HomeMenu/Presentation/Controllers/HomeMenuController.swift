//
//  HomeMenuController.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 28/09/2023.
//

import UIKit
import Combine

final class HomeMenuController: UICollectionViewController {
    private let viewModel: HomeMenuViewModel
    private var cancallables = Set<AnyCancellable>()
    
    init(viewModel: HomeMenuViewModel, layout: UICollectionViewFlowLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        self.configCollectionView()
        self.stateController()
        self.viewModel.viewDidLoad()
    }
    
    private func stateController() {
        self.viewModel.state
            .receive(on: RunLoop.main)
            .sink(receiveValue: { state in
                switch state {
                    case .success:
                        self.collectionView.reloadData()
                        
                    case .loading:
                        print("loading....")
                        
                    case .fail(error: let error):
                        print("error! \(error)")
                }
            })
            .store(in: &self.cancallables)
    }
    
    private func configUI() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        self.collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reusableIdentifier)
    }
}

extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemHomeMenuCell.reusableIdentifier, for: indexPath) as? ItemHomeMenuCell
        else {
            return UICollectionViewCell()
        }
        let viewModelCell = self.viewModel.getItemMenuViewModel(indexPath: indexPath)
        cell.configData(viewModel: viewModelCell)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.menuItemsCount
    }
}
