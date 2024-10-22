//
//  TeamLogoViewController.swift
//  baseProject
//
//  Created by 반성준 on 10/22/24.
//

import UIKit

class TeamLogoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 팀 로고 이미지 뷰 설정
        let logoImageView = UIImageView(image: UIImage(named: "teamLogo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // 로고 클릭 시 팀 소개 페이지로 이동
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logoTapped))
        logoImageView.isUserInteractionEnabled = true
        logoImageView.addGestureRecognizer(tapGesture)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor)  // 정사각형
        ])
    }
    
    // 로고 클릭 시 팀 소개 화면으로 이동
    @objc private func logoTapped() {
        let teamListVC = TeamListViewController()
        navigationController?.pushViewController(teamListVC, animated: true)
    }
}
