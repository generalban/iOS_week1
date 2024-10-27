// MainPageMemberButtonComponent.swift
// 메인 페이지에서 사용하는 멤버 버튼 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

/// 메인 페이지에서 사용하는 멤버 버튼 컴포넌트
class MainPageMemberButtonComponent {
    
    /// 멤버 뷰를 생성하는 함수 (아이콘만 버튼으로 설정)
    /// - Parameters:
    ///   - member: TeamMember 객체
    ///   - target: UIViewController 객체
    ///   - index: 멤버 배열의 인덱스
    /// - Returns: 멤버 뷰를 담은 UIView
    static func createMemberView(for member: TeamMember, target: MainPageViewController, index: Int) -> UIView {
        print("멤버 뷰 생성됨: \(member.name)")
        
        // 전체 뷰 생성
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 이모지 라벨 생성
        let emojiLabel = UILabel()
        emojiLabel.text = member.imageName
        emojiLabel.font = UIFont.systemFont(ofSize: 60)  // 이모지를 크게 표시
        emojiLabel.textAlignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 이름 라벨 생성
        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.font = UIFont(name: "NotoSansKR-Bold", size: 18)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 소개 라벨 생성
        let bioLabel = UILabel()
        bioLabel.text = member.mainBio
        bioLabel.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        bioLabel.textAlignment = .left
        bioLabel.textColor = UIColor.darkGray
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 이름과 소개를 담을 StackView 생성 (수직 정렬)
        let textStackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = 2
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 아이콘 버튼 생성 (화살표 버튼)
        let arrowButton = UIButton(type: .system)
        arrowButton.setImage(UIImage(named: "arrow"), for: .normal)
        arrowButton.tintColor = UIColor.systemBlue
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        arrowButton.tag = index
        arrowButton.addTarget(target, action: #selector(target.memberButtonTapped(_:)), for: .touchUpInside)

        // 이모지, 텍스트, 그리고 네비게이션 아이콘(버튼)을 담을 StackView 생성 (수평 정렬)
        let stackView = UIStackView(arrangedSubviews: [emojiLabel, textStackView, arrowButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20  // 이모지와 텍스트 사이의 간격
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // containerView에 stackView 추가
        containerView.addSubview(stackView)
        
        // 이미지로 하단에 선 추가
        let bottomLineImageView = UIImageView(image: UIImage(named: "line")) // "line" 이미지를 하단에 추가
        bottomLineImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(bottomLineImageView)
        
        // 화살표 버튼의 크기 제약 설정
        NSLayoutConstraint.activate([
            arrowButton.widthAnchor.constraint(equalToConstant: 40),
            arrowButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // StackView의 제약 설정
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -27),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
        
        // 상단과 하단에 선 이미지 제약 설정
        NSLayoutConstraint.activate([
            
            bottomLineImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            bottomLineImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bottomLineImageView.heightAnchor.constraint(equalToConstant: 1) // 선 두께 설정
        ])
        
        // 컨테이너 뷰 자동 레이아웃 적용
        containerView.layer.masksToBounds = true

        return containerView
    }
}
