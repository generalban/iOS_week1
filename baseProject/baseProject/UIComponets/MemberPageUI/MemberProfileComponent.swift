// MemberProfileComponent.swift
// 멤버 프로필 섹션 (이모지, ENFP, Blog, Github) 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

class MemberProfileComponent {

    /// 멤버 이모지 라벨 생성
    static func createEmojiLabel(for member: TeamMember) -> UILabel {
        let label = UILabel()
        label.text = member.imageName
        label.font = UIFont.systemFont(ofSize: 80)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        label.layer.cornerRadius = 56 // 반지름을 height/2로 설정하여 둥근 모양 유지
        label.layer.masksToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 112),
            label.heightAnchor.constraint(equalToConstant: 112)
        ])
        
        return label
    }

    /// ENFP, Blog, Github 정보를 포함하는 StackView 생성
    static func createMemberInfoStackView(for member: TeamMember, target: TeamMemberViewController) -> UIStackView {
        let mbtiInfoLabel = UILabel()
        mbtiInfoLabel.text = member.mbti
        mbtiInfoLabel.font = UIFont(name: "Quicksand-Bold", size: 18)
        mbtiInfoLabel.textColor = UIColor(red: 0/255, green: 133/255, blue: 206/255, alpha: 1.0)
        mbtiInfoLabel.textAlignment = .center
        mbtiInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mbtiInfoLabel.widthAnchor.constraint(equalToConstant: 62),
            mbtiInfoLabel.heightAnchor.constraint(equalToConstant: 36)
        ])

        let blogButton = UIButton(type: .system)
        blogButton.tintColor = UIColor(red: 0/255, green: 133/255, blue: 206/255, alpha: 1.0)
        blogButton.setImage(UIImage(named: "Blog"), for: .normal)
        blogButton.addTarget(target, action: #selector(target.openBlogLink), for: .touchUpInside)
        blogButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blogButton.widthAnchor.constraint(equalToConstant: 62),
            blogButton.heightAnchor.constraint(equalToConstant: 36)
        ])

        let githubButton = UIButton(type: .system)
        githubButton.tintColor = UIColor(red: 0/255, green: 133/255, blue: 206/255, alpha: 1.0)
        githubButton.setImage(UIImage(named: "Github"), for: .normal)
        githubButton.addTarget(target, action: #selector(target.openGitHubLink), for: .touchUpInside)
        githubButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            githubButton.widthAnchor.constraint(equalToConstant: 62),
            githubButton.heightAnchor.constraint(equalToConstant: 36)
        ])

        let mbtiLabel = UILabel()
        mbtiLabel.text = "MBTI"
        mbtiLabel.font = UIFont(name: "NotoSansKR-Light", size: 14)
        mbtiLabel.textAlignment = .center

        let blogLabel = UILabel()
        blogLabel.text = "Blog"
        blogLabel.font = UIFont(name: "NotoSansKR-Light", size: 14)
        blogLabel.textAlignment = .center

        let githubLabel = UILabel()
        githubLabel.text = "Github"
        githubLabel.font = UIFont(name: "NotoSansKR-Light", size: 14)
        githubLabel.textAlignment = .center

        let mbtiStackView = UIStackView(arrangedSubviews: [mbtiInfoLabel, mbtiLabel])
        mbtiStackView.axis = .vertical
        mbtiStackView.alignment = .center

        let blogStackView = UIStackView(arrangedSubviews: [blogButton, blogLabel])
        blogStackView.axis = .vertical
        blogStackView.alignment = .center

        let githubStackView = UIStackView(arrangedSubviews: [githubButton, githubLabel])
        githubStackView.axis = .vertical
        githubStackView.alignment = .center

        let mainStackView = UIStackView(arrangedSubviews: [mbtiStackView, blogStackView, githubStackView])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .equalSpacing
        mainStackView.alignment = .center

        return mainStackView
    }
}
