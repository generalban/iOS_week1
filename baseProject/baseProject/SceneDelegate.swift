//
//  SceneDelegate.swift
//  baseProject
//
//  Created by 반성준 on 10/22/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let rootVC = UINavigationController(rootViewController: TeamLogoViewController())
        window?.rootViewController = rootVC
        
        window?.makeKeyAndVisible()
    }
    
}
