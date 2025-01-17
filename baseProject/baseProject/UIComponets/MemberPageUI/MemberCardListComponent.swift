import UIKit

/// 카드 리스트를 표시하는 UIStackView 생성 컴포넌트
class MemberCardListComponent {
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
            let attrString = NSMutableAttributedString(string: contentLabel.text!)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
            contentLabel.attributedText = attrString

            cardView.addSubview(titleLabel)
            cardView.addSubview(contentLabel)

            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
                contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                contentLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
                contentLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
                contentLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -30)
            ])

            stackView.addArrangedSubview(cardView)
        }

        return stackView
    }
}
