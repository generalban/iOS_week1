//
//  TeamMemberViewController.swift
//  baseProject
//
//  Created by 반성준 on 10/22/24.
//

import UIKit

class TeamMemberViewController: UIViewController {

    private let member: TeamMember
    
    init(member: TeamMember) {
        self.member = member
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        // 1. 프로필 이미지
        let profileImageView = UIImageView(image: UIImage(named: member.imageName))
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)

        // 2. 멤버 이름 레이블
        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        // 3. MBTI 레이블
        let mbtiLabel = UILabel()
        mbtiLabel.text = "MBTI: \(member.mbti)"
        mbtiLabel.font = UIFont.systemFont(ofSize: 16)
        mbtiLabel.textAlignment = .center
        mbtiLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mbtiLabel)
        
        // 4. 블로그, 깃허브 버튼
        let blogButton = UIButton(type: .system)
        blogButton.setTitle("블로그", for: .normal)
        blogButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        blogButton.tintColor = .blue
        blogButton.translatesAutoresizingMaskIntoConstraints = false

        let githubButton = UIButton(type: .system)
        githubButton.setTitle("깃허브", for: .normal)
        githubButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        githubButton.tintColor = .blue
        githubButton.translatesAutoresizingMaskIntoConstraints = false

        let buttonStackView = UIStackView(arrangedSubviews: [blogButton, githubButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        // 5. 자기소개 레이블
        let bioLabel = UILabel()
        bioLabel.text = member.bio
        bioLabel.numberOfLines = 0
        bioLabel.textAlignment = .center
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        // 6. 팀원들과의 연결을 위한 사진들
        let teamMemberImagesStack = UIStackView()
        teamMemberImagesStack.axis = .horizontal
        teamMemberImagesStack.alignment = .center
        teamMemberImagesStack.spacing = 10
        teamMemberImagesStack.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<5 {
            let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 25
            imageView.clipsToBounds = true
            imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            teamMemberImagesStack.addArrangedSubview(imageView)
        }
        view.addSubview(teamMemberImagesStack)

        // 7. 컨텐츠 목록 (컨텐츠 제목 및 설명)
        let contentTitleLabel = UILabel()
        contentTitleLabel.text = "컨텐츠 제목"
        contentTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let contentDescLabel = UILabel()
        contentDescLabel.text = "컨텐츠 블라블라"
        contentDescLabel.numberOfLines = 0
        contentDescLabel.translatesAutoresizingMaskIntoConstraints = false

        let contentStackView = UIStackView(arrangedSubviews: [contentTitleLabel, contentDescLabel])
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentStackView)

        // 8. Auto Layout 설정
        NSLayoutConstraint.activate([
            // 프로필 이미지
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // 이름 레이블
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // MBTI 레이블
            mbtiLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            mbtiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 버튼 스택뷰
            buttonStackView.topAnchor.constraint(equalTo: mbtiLabel.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 자기소개 레이블
            bioLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // 팀원 연결 이미지 스택뷰
            teamMemberImagesStack.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 20),
            teamMemberImagesStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 컨텐츠 스택뷰
            contentStackView.topAnchor.constraint(equalTo: teamMemberImagesStack.bottomAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
