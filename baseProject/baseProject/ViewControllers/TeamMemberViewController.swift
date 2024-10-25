// TeamMemberViewController.swift
// 멤버 개인 페이지를 관리하는 ViewController
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit
import SwiftUI

class TeamMemberViewController: UIViewController {
    
    // 멤버 정보를 담을 변수
    var member: TeamMember
    
    // 전체 멤버 배열을 저장하는 변수
    var allMembers: [TeamMember]
    
    // 멤버 객체를 초기화하면서 전달받아 설정하는 init 메서드
    init(member: TeamMember, allMembers: [TeamMember]) {
        self.member = member
        self.allMembers = allMembers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 뷰가 로드되었을 때 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 메인 페이지 UI를 설정하는 함수 호출
        setupMemberPage(for: member)
    }
    
    /// 멤버 페이지를 설정하는 함수
    /// - Parameter member: TeamMember 객체
    private func setupMemberPage(for member: TeamMember) {
        // MemberPageComponets에서 전체 페이지를 생성하여 스크롤 가능하게 설정
        let scrollView = MemberPageComponents.createMemberPage(for: member, target: self)
        
        
        // ScrollView를 뷰에 추가하고 Auto Layout 설정
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    

    // 개인 플레이그라운드 화면으로 전환하는 메서드
    @objc func openPlayground() {
        // 멤버 이름에 따라 해당 스토리보드를 찾아야 함
        var storyboardName: String?
        var storyboardID: String?
        
        switch member.name {
        case "김동글":
            storyboardName = "NemoStoryboard" // 스토리보드 파일 이름 (확장자 .storyboard 제외)
            storyboardID = "NemoStoryboard" // Storyboard ID
        case "김상민":
            storyboardName = "Jamong"
            storyboardID = "JamongStroyboard"
        case "반성준":
            // 반성준의 경우 SwiftUI 뷰 사용
            let swiftUIView = ContentView() // SwiftUI 뷰 인스턴스 생성
            let hostingController = UIHostingController(rootView: swiftUIView) // UIHostingController로 래핑
            navigationController?.pushViewController(hostingController, animated: true)
        case "서지민":
            storyboardName = "JiminStoryboard"
            storyboardID = "JiminViewController"
        case "임성수":
            storyboardName = "SeongsooStoryboard"
            storyboardID = "SeongsooStoryboard"
        case "한현준":
            storyboardName = "hyeonjun"
            storyboardID = "hyeonjun"
        default:
            return // 해당 멤버가 없는 경우 아무 작업도 하지 않음
        }
        
        // 스토리보드 파일을 불러오고, ViewController 인스턴스 생성
        guard let storyboardName = storyboardName, let storyboardID = storyboardID else {
            return
        }
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        let playgroundVC = storyboard.instantiateViewController(withIdentifier: storyboardID)
        navigationController?.pushViewController(playgroundVC, animated: true)
    }
        
    // 블로그 링크를 여는 메서드
    @objc func openBlogLink() {
        if let url = URL(string: member.blogUrl) {
            UIApplication.shared.open(url)
        }
    }
        
    // GitHub 링크를 여는 메서드
    @objc func openGitHubLink() {
        if let url = URL(string: member.githubUrl) {
            UIApplication.shared.open(url)
        }
    }
    
    // 다른 멤버 페이지로 이동하는 함수 (멤버 찾기 섹션에서 버튼을 눌렀을 때 호출)
    @objc func openMemberPage(_ sender: UIButton) {
        let selectedMember = allMembers[sender.tag]  // tag를 사용하여 해당 멤버를 찾음
        let memberVC = TeamMemberViewController(member: selectedMember, allMembers: allMembers)
        navigationController?.pushViewController(memberVC, animated: true)
    }
}
