//  TeamMember.swift
//  팀 멤버 구조체 관리 기능을 정의합니다.
//  작성자: 반성준
//  작성일: 2024-22-24


import Foundation

/// 카드 정보를 담는 구조체
struct Card: Decodable {
    /// 카드 제목
    let title: String
    
    /// 카드 내용
    let content: String
}

/// 팀 멤버 개인정보를 담고 있는 구조체.
struct TeamMember: Decodable {
    /// 멤버 이름
    let name: String
    
    /// MBTI
    let mbti: String
    
    /// 역활
    let role: String
    
    /// 소개
    let bio: String
    
    /// 이미지 이름
    let imageName: String
    
    /// Blog URL
    let blogUrl: String
    
    /// Github URL
    let githubUrl: String
    
    /// 카드 정보 배열
    let cards: [Card]
}


// JSON에서 teamMembers 배열을 포함하는 구조체
struct TeamMembersResponse: Decodable {
    let teamMembers: [TeamMember]
}
