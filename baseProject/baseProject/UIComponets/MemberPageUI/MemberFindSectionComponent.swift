// MemberFindComponent.swift
// 멤버 찾기 섹션 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

class MemberFindSectionComponent {

    /// 멤버 찾기 섹션을 위한 StackView 생성
    static func createMemberFindSection(for members: [TeamMember], target: TeamMemberViewController) -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = "멤버 찾기"
        titleLabel.font = UIFont(name: "NotoSansKR-Bold", size: 16)

        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10

        for (index, member) in members.enumerated() {
            let memberButton = MemberButtonComponent.createMemberButton(for: member, target: target, index: index)
            
            NSLayoutConstraint.activate([
                memberButton.widthAnchor.constraint(equalToConstant: 100),
                memberButton.heightAnchor.constraint(equalToConstant: 129)
            ])

            stackView.addArrangedSubview(memberButton)
        }

        scrollView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, scrollView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 10

        return mainStackView
    }
}
