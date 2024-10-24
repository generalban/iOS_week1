// MainPageComponets.swift
// 메인 페이지 UI 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

class MainPageComponents {
    
    /// 프로젝트 정보 섹션을 생성하는 함수
    static func createTeamInfoView() -> UIView {
        let view = UIView()
        
        /// 이미지 뷰 생성 (배경 이미지)
        let imageView = UIImageView(image: UIImage(named: "mainImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        /// 타이틀 라벨 상단 미니 프로젝트 1팀
        let teamProjectLabel = UILabel()
        teamProjectLabel.text = "iOS 5기 미니 프로젝트 1팀"
        teamProjectLabel.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        teamProjectLabel.textColor = UIColor(red: 124/255, green: 124/255, blue: 124/255, alpha: 1.0)
        teamProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(teamProjectLabel)
        
        /// 타이틀 라벨
        let titleLabel = UILabel()
        titleLabel.text = "GOM.MO"
        titleLabel.font = UIFont(name: "Pacifico-Regular", size: 50)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        /// 설명 라벨
        let descriptionLabel = UILabel()
        descriptionLabel.text = "성수곰과 그를 따르는 5명의 곰돌이\n로, 곰들의 모임을 줄여 곰모라고 팀\n이름을 정해보았다."
        descriptionLabel.font = UIFont(name: "NotoSansKR-Light", size: 24)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 3
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        /// 상세 보기 버튼
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(red: 0/255, green: 133/255, blue: 206/255, alpha: 1.0)
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14)
        
        /// 폰트 설정
        var attributedTitle = AttributedString("팀 프로젝트 상세보기")
        attributedTitle.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        attributedTitle.foregroundColor = UIColor.white
        
        config.attributedTitle = attributedTitle
        
        let detailButton = UIButton(configuration: config)
        detailButton.layer.cornerRadius = 8
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailButton)
        
        
        /// 이미지 뷰와 스택 뷰 제약 설정
        NSLayoutConstraint.activate([
            /// 이미지 뷰 제약
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            teamProjectLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            teamProjectLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            teamProjectLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: teamProjectLabel.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            
            detailButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            detailButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            detailButton.widthAnchor.constraint(equalToConstant: 177),
            detailButton.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        return view
    }
        
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
    
    /// 멤버 리스트 섹션을 생성하는 함수
    static func createMemberListView(members: [TeamMember], target: MainPageViewController) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        for (index, member) in members.enumerated() {
            print("멤버 생성 중: \(member.name)") // 멤버가 제대로 전달되는지 확인
            let memberButton = MainPageMemberButtonComponent.createMemberButton(for: member, target: target, index: index)
            
            // 버튼 크기 제약 추가
            memberButton.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(memberButton)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.addSubview(stackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // 수평 스크롤 방지
        ])
        
        return scrollView
    }
}
