//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 28/09/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: Coordinator!
    var appFactory: AppFactory!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let navigation = UINavigationController()
        
        self.appFactory = AppFactoryImp()
        self.window = UIWindow(windowScene: scene)
        self.appCoordinator = AppCoordinator(navigation: navigation, appFactory: self.appFactory, window: self.window)
        self.appCoordinator.start()
    }
}
