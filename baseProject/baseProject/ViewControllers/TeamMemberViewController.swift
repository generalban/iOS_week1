// TeamMemberViewController.swift
// 멤버 개인 페이지를 관리하는 ViewController
// 작성자: Jamong
// 작성일: 2024-10-23

import UIKit

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
    // 다른 멤버 페이지 이동하는 함수 (멤버 찾기 섹션에서 버튼을 눌렀을 떄 호출)
    @objc func openMemberPage(_ sender: UIButton) {
        print("멤버 페이지로 이동")
    }
}
