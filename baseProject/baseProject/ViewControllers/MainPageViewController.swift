// MainPageViewController.swift
// 메인 팀 페이지를 관리하는 ViewController
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

/// 메인 페이지를 관리하는 뷰 컨트롤러
class MainPageViewController: UIViewController {

    /// 팀 멤버 목록
    var members: [TeamMember] = []

    /// 뷰가 로드되었을 때 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()

        /// 팀 멤버 데이터 로드
        if let loadMembers = DataManager.loadTeamMembers() {
            members = loadMembers
        }
        
        // 멤버가 제대로 로드되었는지 확인
        print("로드된 멤버 수: \(members.count)")

        // 메인 페이지 UI를 설정하는 함수 호출
        setupMainPage()
    }

    /// 메인 페이지 UI를 설정하는 함수
    func setupMainPage() {
        // 상단 노란색 배경
        let topYellowBackgroundView = UIView()
        topYellowBackgroundView.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0)
        topYellowBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topYellowBackgroundView)
        
        // 하단 흰색 배경
        let bottomWhiteBackgroundView = UIView()
        bottomWhiteBackgroundView.backgroundColor = .white
        bottomWhiteBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomWhiteBackgroundView)
        
        // 스크롤 뷰 생성 (프로젝트 정보 및 멤버 섹션 추가)
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear // 스크롤뷰 배경을 투명하게 설정
        view.addSubview(scrollView)
        
        // 전체 콘텐츠를 담을 StackView 생성
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        // 1. 프로젝트 정보 섹션 추가 (노란색 배경)
        let projectInfoView = MainPageComponents.createTeamInfoView()
        contentStackView.addArrangedSubview(projectInfoView)
        
        // 2. 멤버 섹션 추가 (하얀색 배경)
        let membersTitleView = MainPageComponents.createMembersTitleView()
        contentStackView.addArrangedSubview(membersTitleView)
        
        // 3. 멤버 리스트 섹션 추가
        let memberListView = MainPageComponents.createMemberListView(members: members, target: self)
        contentStackView.addArrangedSubview(memberListView)
        
        membersTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        memberListView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true

    
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            // 상단 노란색 배경 제약
            topYellowBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            topYellowBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topYellowBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topYellowBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            // 하단 흰색 배경 제약
            bottomWhiteBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomWhiteBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomWhiteBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomWhiteBackgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            // ScrollView 제약
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // ContentStackView 제약
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // 여기 추가: ContentStackView의 높이를 ScrollView의 높이 이상으로 설정 (또는 명시적으로 콘텐츠 높이를 계산할 수도 있습니다)
            contentStackView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }
    
    // 멤버 버튼이 눌렀을 때 호출되는 메서드
    @objc func memberButtonTapped(_ sender: UIButton){
        let member = members[sender.tag]
        let memberVC = TeamMemberViewController(member: member, allMembers: members)
        navigationController?.pushViewController(memberVC, animated: true)
    }
}
