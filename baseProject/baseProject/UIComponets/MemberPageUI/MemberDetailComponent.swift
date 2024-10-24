// MemberDetailComponent.swift
// 멤버 이름, 소개, 플레이그라운드 버튼 컴포넌트 관리
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

class MemberDetailComponent {

    /// 멤버 이름, 소개, 플레이그라운드 버튼을 포함하는 StackView 생성
    static func createMemberDetailStackView(for member: TeamMember) -> UIStackView {
        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        nameLabel.textAlignment = .left

        let bioLabel = UILabel()
        bioLabel.text = member.bio
        bioLabel.font = UIFont(name: "NotoSansKR-Thin", size: 16)
        bioLabel.textAlignment = .left
        bioLabel.numberOfLines = 3

        let playgroundButton = UIButton(type: .system)
        playgroundButton.setTitle("개인 플레이그라운드 보기", for: .normal)
        playgroundButton.setTitleColor(.black, for: .normal)
        playgroundButton.titleLabel?.font = UIFont(name: "NotoSansKR-Light", size: 16)
        playgroundButton.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0)
        playgroundButton.layer.cornerRadius = 8

        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, bioLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 5

        let mainStackView = UIStackView(arrangedSubviews: [labelStackView, playgroundButton])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20

        return mainStackView
    }
}
