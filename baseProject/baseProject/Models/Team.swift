//  Team.swift
//  팀 정보 구조체 관리 기능을 정의합니다.
//  작성자: 반성준
//  작성일: 2024-22-24

import Foundation

/// 팀  정보를 담고 있는 구조체
/// 팀의 이름, 설명, 목표, 그리고 팀 구성원을 포함합니다.
struct Team {
    /// 팀의 이름
    let name: String
    
    /// 팀에 대한 간략한 설명
    let description: String
    
    /// 팀의 목표
    let goal: String
    
    /// 팀에 소속된 팀원들의 목록
    let members: [TeamMember]
}
