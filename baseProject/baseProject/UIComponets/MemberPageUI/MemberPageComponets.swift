// 전체 멤버 페이지를 스크롤 가능한 UIView로 합치는 컴포넌트
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

/// 멤버 페이지와 관련된 UI 컴포넌트를 조합하여 전체 페이지를 구성하는 클래스
class MemberPageComponents {

    /// 전체 멤버 페이지를 스크롤 가능한 UIView로 반환
    /// - Parameter member: TeamMember 객체
    /// - Parameter target: 해당 ViewController (주로 TeamMemberViewController)
    /// - Returns: 멤버 페이지를 스크롤 가능한 UIView로 반환
    static func createMemberPage(for member: TeamMember, target: TeamMemberViewController) -> UIScrollView {
        // UIScrollView 생성
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        
        // 전체 콘텐츠를 담을 UIStackView 생성
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        contentStackView.alignment = .fill
        
        // 멤버 이모지 및 기본 정보 (ENFP, Blog, Github) 섹션 추가
        let emojiLabel = MemberProfileComponent.createEmojiLabel(for: member)
        let memberInfoStackView = MemberProfileComponent.createMemberInfoStackView(for: member, target: target)
        
        // 멤버 이모지와 정보 StackView를 가로로 배치하는 horizontalStackView 생성
        let horizontalStackView = UIStackView(arrangedSubviews: [emojiLabel, memberInfoStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 32
        horizontalStackView.alignment = .center
        contentStackView.addArrangedSubview(horizontalStackView)
        
        // 멤버 이름, 소개, 플레이그라운드 버튼 섹션 추가
        let memberDetailStackView = MemberDetailComponent.createMemberDetailStackView(for: member, target: target)
        contentStackView.addArrangedSubview(memberDetailStackView)
        
        // 멤버 찾기 섹션 추가
        let memberFindSection = MemberFindSectionComponent.createMemberFindSection(for: target.allMembers, target: target)
        contentStackView.addArrangedSubview(memberFindSection)
        
        // 카드 리스트 섹션 추가
        let cardListStackView = MemberCardListComponent.createCardListStackView(cards: member.cards)
        contentStackView.addArrangedSubview(cardListStackView)
        
        // ScrollView에 contentStackView를 추가
        scrollView.addSubview(contentStackView)
        
        // Auto Layout 설정
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView를 ScrollView 내부에 맞추기 위한 제약조건 설정
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // 수평 스크롤 방지
        ])
        
        return scrollView
    }
}
