// MemberButtonComponent.swift
// 멤버 찾기 버튼 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

class MemberPageButtonComponent {

    /// 멤버 버튼 생성
    static func createMemberButton(for member: TeamMember, target: UIViewController, index: Int) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.tag = index

        let emojiLabel = UILabel()
        emojiLabel.text = member.imageName
        emojiLabel.font = UIFont.systemFont(ofSize: 60)
        emojiLabel.contentMode = .scaleAspectFit
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = member.name
        nameLabel.font = UIFont(name: "NotoSansKR-Light", size: 16)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [emojiLabel, nameLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택뷰가 터치 이벤트를 받지 않도록 설정
        stackView.isUserInteractionEnabled = false

        button.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: button.centerYAnchor),

            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 130)
        ])

        if let teamMemberVC = target as? TeamMemberViewController {
            button.addTarget(teamMemberVC, action: #selector(teamMemberVC.openMemberPage(_:)), for: .touchUpInside)
        }

        return button
    }
}
