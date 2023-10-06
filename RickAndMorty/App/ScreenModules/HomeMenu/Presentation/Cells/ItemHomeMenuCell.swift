//
//  ItemHomeMenuCell.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 28/09/2023.
//

import UIKit

final class ItemHomeMenuCell: UICollectionViewCell {
    // MARK: - Private Properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let categoryMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Category"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public func configData(viewModel: ItemHomeMenuViewModel) {
        self.titleCategoryLabel.text = viewModel.title
        self.categoryMenuImageView.image = UIImage(named: viewModel.imageName)
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configUI() {
        self.addSubview(self.mainContainer)
        self.mainContainer.fillSuperView(widthPadding: 10)
        
        self.mainContainer.addSubview(self.categoryMenuImageView)
        self.categoryMenuImageView.fillSuperView()
        
        self.configGradientForTitle()
        
        self.mainContainer.addSubview(self.titleCategoryLabel)
        self.titleCategoryLabel.setConstraints(
            right: self.mainContainer.rightAnchor,
            bottom: self.mainContainer.bottomAnchor,
            left: self.mainContainer.leftAnchor,
            pRight: 10,
            pBottom: 10,
            pLeft: 10
        )
    }
    
    private func configGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [0.6, 0.9]
        self.mainContainer.layer.addSublayer(gradientMaskLayer)
    }
}

// MARK: - Extensions
extension ItemHomeMenuCell: Reusable {}
