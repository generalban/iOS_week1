// MemberListComponent.swift
// 멤버 리스트 섹션 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

class MainPageMemberListComponent {
    
    /// 멤버 리스트 섹션을 생성하는 함수
    static func createMemberListView(members: [TeamMember], target: MainPageViewController) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        for (index, member) in members.enumerated() {
            print("멤버 생성 중: \(member.name)") // 멤버가 제대로 전달되는지 확인
            let memberButton = MainPageMemberButtonComponent.createMemberView(for: member, target: target, index: index)
            stackView.addArrangedSubview(memberButton)
        }
        
        return stackView
    }
}
