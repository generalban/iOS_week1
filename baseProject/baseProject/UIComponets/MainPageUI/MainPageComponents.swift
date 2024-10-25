// MainPageComponets.swift
// 메인 페이지 UI 컴포넌트를 관리
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

class MainPageComponents {
    
    /// 프로젝트 정보 섹션 통합
    static func createTeamInfoView(target: MainPageViewController) -> UIView {
        return MainPageTeamInfoComponent.createTeamInfoView(target: target, action: #selector(target.didTapDetailButton))
    }
    
    /// 멤버 타이틀 섹션 통합
    static func createMembersTitleView() -> UIView {
        return MainPageMembersTitleComponent.createMembersTitleView()
    }
    
    /// 멤버 리스트 섹션 통합
    static func createMemberListView(members: [TeamMember], target: UIViewController) -> UIView {
        return MainPageMemberListComponent.createMemberListView(members: members, target: target as! MainPageViewController)
    }
    
    // SPARTA 하단 섹션
    static func createSpartaView() -> UIView{
        return MainPageSpartaComponent.createSpartaView()
    }
}
