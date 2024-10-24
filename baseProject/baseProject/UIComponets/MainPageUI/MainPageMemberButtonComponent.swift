// MainPageMemberButtonComponent.swift
// 메인 페이지에서 사용하는 멤버 버튼 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

/// 메인 페이지에서 사용하는 멤버 버튼 컴포넌트
class MainPageMemberButtonComponent {
    
    /// 멤버 버튼을 생성하는 함수
    /// - Parameters:
    ///   - member: TeamMember 객체
    ///   - target: UIViewController 객체
    ///   - index: 멤버 배열의 인덱스
    /// - Returns: 멤버 버튼을 담은 UIButton
    static func createMemberButton(for member: TeamMember, target: MainPageViewController, index: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.tag = index
        button.backgroundColor = UIColor.clear
        button.addTarget(target, action: #selector(target.memberButtonTapped(_:)), for: .touchUpInside)
        
        // 이모지 라벨 생성
        let emojiLabel = UILabel()
        emojiLabel.text = member.imageName
        emojiLabel.font = UIFont.systemFont(ofSize: 40)  // 이모지를 크게 표시
        emojiLabel.textAlignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 이름 라벨 생성
        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 소개 라벨 생성
        let bioLabel = UILabel()
        bioLabel.text = member.bio
        bioLabel.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        bioLabel.textAlignment = .left
        bioLabel.textColor = UIColor.darkGray
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 이름과 소개를 담을 StackView 생성 (수직 정렬)
        let textStackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 아이콘 추가
        let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        arrowImageView.tintColor = UIColor.systemBlue
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // 이모지, 텍스트, 그리고 네비게이션 아이콘을 담을 StackView 생성 (수평 정렬)
        let stackView = UIStackView(arrangedSubviews: [emojiLabel, textStackView, arrowImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10  // 이모지와 텍스트 사이의 간격
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 버튼에 StackView 추가
        button.addSubview(stackView)

        // 화살표 이미지의 크기 제약 설정
        NSLayoutConstraint.activate([
            arrowImageView.widthAnchor.constraint(equalToConstant: 40),
            arrowImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // StackView의 제약 설정
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10)
        ])

        // 버튼 높이 설정
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true

        // 위와 아래 보더라인 추가
        let topBorder = CALayer()
        topBorder.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: button.frame.size.width, height: 1)
        button.layer.addSublayer(topBorder)

        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        bottomBorder.frame = CGRect(x: 0, y: button.frame.size.height - 1, width: button.frame.size.width, height: 1)
        button.layer.addSublayer(bottomBorder)
        
        // 자동으로 레이아웃 조정할 수 있도록 추가로 설정
        button.layer.masksToBounds = true

        return button
    }
}
