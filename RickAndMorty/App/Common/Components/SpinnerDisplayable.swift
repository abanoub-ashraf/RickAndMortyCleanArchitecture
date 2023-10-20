//
//  SpinnerDisplayable.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 13/10/2023.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self: UIViewController {
    private var parentView: UIView {
        return self.navigationController?.view ?? view
    }
    
    private var doesNotExistAnotherSpinner: Bool {
        return self.parentView.viewWithTag(ViewValues.tagIdentifierSpinner) == nil
    }
    
    func showSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        self.configureSpinner()
    }
    
    func hideSpinner() {
        if let foundView = parentView.viewWithTag(ViewValues.tagIdentifierSpinner) {
            foundView.removeFromSuperview()
        }
    }
    
    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag = ViewValues.tagIdentifierSpinner
        self.parentView.addSubview(containerView)
        containerView.fillSuperView()
        containerView.backgroundColor = .black.withAlphaComponent(ViewValues.opacityContainerSpinner)
        self.addSpinnerIndicatorTocontainer(containerView: containerView)
    }
    
    private func addSpinnerIndicatorTocontainer(containerView: UIView) {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        containerView.addSubview(spinner)
        spinner.centerXY()
    }
}
