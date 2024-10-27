// MainPageViewController.swift
// 메인 팀 페이지를 관리하는 ViewController
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

/// 메인 페이지를 관리하는 뷰 컨트롤러
class MainPageViewController: UIViewController, UIScrollViewDelegate {

    /// 팀 멤버 목록
    var members: [TeamMember] = []

    /// 상단 노란색 배경 뷰
    let topYellowBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    /// 뷰가 로드되었을 때 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        /// 팀 멤버 데이터 로드
        if let loadMembers = DataManager.loadTeamMembers() {
            members = loadMembers
        }
        
        // 멤버가 제대로 로드되었는지 확인
        print("로드된 멤버 수: \(members.count)")

        // 상단 노란색 배경을 추가
        setupTopYellowBackground()

        // 메인 페이지 UI를 설정하는 함수 호출
        setupMainPage()
    }

    /// 상단 노란색 배경을 설정하는 함수
    func setupTopYellowBackground() {
        // 상단에 노란색 배경을 추가
        view.addSubview(topYellowBackgroundView)

        // Auto Layout 제약 설정
        NSLayoutConstraint.activate([
            // 상단 노란색 배경은 화면 최상단에서 safeArea까지 채움
            topYellowBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            topYellowBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topYellowBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topYellowBackgroundView.heightAnchor.constraint(equalToConstant: 105) // 원하는 높이 설정
        ])
    }

    /// 메인 페이지 UI를 설정하는 함수
    func setupMainPage() {
        // 스크롤 뷰 생성 (프로젝트 정보 및 멤버 섹션 추가)
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear // 스크롤뷰 배경을 투명하게 설정
        scrollView.delegate = self  // 스크롤 뷰의 델리게이트 설정
        view.addSubview(scrollView)
        
        // 전체 콘텐츠를 담을 StackView 생성
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        // 1. 프로젝트 정보 섹션 추가
        let projectInfoView = MainPageComponents.createTeamInfoView(target: self
        )
        contentStackView.addArrangedSubview(projectInfoView)
        
        // 2. 멤버 섹션 추가
        let membersTitleView = MainPageComponents.createMembersTitleView()
        contentStackView.addArrangedSubview(membersTitleView)
        
        // -> 멤버 섹션 하단 라인 추가
        // 하단 선 이미지를 추가할 UIImageView 생성
        let bottomLineImageView = UIImageView(image: UIImage(named: "line")) // 선 이미지 추가
        bottomLineImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomLineImageView)
        
        // 선 이미지 제약 설정
        NSLayoutConstraint.activate([
            bottomLineImageView.topAnchor.constraint(equalTo: membersTitleView.bottomAnchor, constant: 10), // 멤버 타이틀 섹션 하단에 위치
            bottomLineImageView.centerXAnchor.constraint(equalTo: membersTitleView.centerXAnchor),
            bottomLineImageView.heightAnchor.constraint(equalToConstant: 1) // 선의 높이(두께)를 2 포인트로 설정
        ])
        
        
        // 3. 멤버 리스트 섹션 추가
        let memberListView = MainPageComponents.createMemberListView(members: members, target: self)
        contentStackView.addArrangedSubview(memberListView)
        
        // 4. SPARTA 하단 섹션 추가
        let spartaView = MainPageComponents.createSpartaView()
        contentStackView.addArrangedSubview(spartaView)
        
        // 각 뷰의 고정 높이 설정
        membersTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        memberListView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        spartaView.heightAnchor.constraint(equalToConstant: 200).isActive = true  // 필요에 따라 높이 수정

        // Auto Layout 설정
        NSLayoutConstraint.activate([
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
            
            // ContentStackView의 높이를 ScrollView의 높이 이상으로 설정
            contentStackView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }
    
    /// 스크롤 이벤트를 처리하는 메서드
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        // 스크롤 위치에 따라 배경색 변경
        if offset > 755 {
            // 스크롤이 일정 부분 내려가면 노란색 배경이 하얀색으로 변함
            topYellowBackgroundView.backgroundColor = UIColor.white
        } else {
            // 상단에 가까워지면 다시 노란색으로 복구
            topYellowBackgroundView.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0)
        }
    }
    
    // 멤버 버튼이 눌렀을 때 호출되는 메서드
    @objc func memberButtonTapped(_ sender: UIButton){
        let member = members[sender.tag]
        let memberVC = TeamMemberViewController(member: member, allMembers: members)
        navigationController?.pushViewController(memberVC, animated: true)
    }
    
    @objc func didTapDetailButton() {
        let detailVC = MainDetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

