// MembersTitleComponent.swift
// 멤버 타이틀 섹션 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

class MainPageMembersTitleComponent {

/// 멤버 타이틀 섹션을 생성하는 함수
    static func createMembersTitleView() -> UIView {
        let titleLabel = UILabel()
        titleLabel.text = "GOM.MO members"
        titleLabel.font = UIFont(name: "Pacifico-Regular", size: 24)
        
        let view = UIView()
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        return view
    }
}
