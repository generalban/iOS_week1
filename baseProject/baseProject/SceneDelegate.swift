//
//  SceneDelegate.swift
//  baseProject
//
//  Created by Jamong on 10/23/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 루트 뷰 컨트롤러 설정
        let rootVC = UINavigationController(rootViewController: MainPageViewController())
        
        // 자기 스토리보드를 위한 test view 지정. 사용할 경우 바로 윗줄 주석처리하시고 아래 주석 풀어서 사용하세요.
//        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: nil)
//        let testViewController = storyboard.instantiateViewController(withIdentifier: "SeongsooViewController")
//        let rootVC = UINavigationController(rootViewController: testViewController)
        
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}


