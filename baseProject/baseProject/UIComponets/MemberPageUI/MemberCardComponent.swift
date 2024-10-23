// MemberCardComponent.swift
// 멤버 카드 리스트 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

class MemberCardComponent {

    /// 카드 리스트를 표시하는 UIStackView 생성
    static func createCardListStackView(cards: [Card]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10

        for card in cards {
            let cardView = UIView()
            cardView.backgroundColor = .white
            cardView.layer.cornerRadius = 8
            cardView.layer.borderColor = UIColor.lightGray.cgColor
            cardView.layer.borderWidth = 1

            let titleLabel = UILabel()
            titleLabel.text = card.title
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16)

            let contentLabel = UILabel()
            contentLabel.text = card.content
            contentLabel.font = UIFont.systemFont(ofSize: 14)
            contentLabel.numberOfLines = 0

            cardView.addSubview(titleLabel)
            cardView.addSubview(contentLabel)

            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
                contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                contentLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
                contentLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
                contentLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
            ])

            stackView.addArrangedSubview(cardView)
        }

        return stackView
    }
}
