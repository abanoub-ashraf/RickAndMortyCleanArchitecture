//
//  MessageDisplayable.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 20/10/2023.
//

import UIKit

protocol MessageDisplayable: AnyObject { }

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
