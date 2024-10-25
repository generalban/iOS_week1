// MembersTitleComponent.swift
// 멤버 타이틀 섹션 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

class MainPageSpartaComponent {

/// 멤버 타이틀 섹션을 생성하는 함수
    static func createSpartaView() -> UIView {
        let view = UIView()
        
        let imageView = UIImageView(image: UIImage(named: "SPARTA"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let titleLabel = UILabel()
        titleLabel.text = "© 2020-2024 GOM.MO with Team Sparta"
        titleLabel.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        titleLabel.textColor = UIColor(red: 108/255, green: 72/255, blue: 58/255, alpha: 1.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 132),
            imageView.heightAnchor.constraint(equalToConstant: 69),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 36),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }
}
