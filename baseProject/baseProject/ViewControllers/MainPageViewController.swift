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
        
        view.backgroundColor = .white
        
        /// 팀 멤버 데이터 로드
        if let loadMembers = DataManager.loadTeamMembers() {
            members = loadMembers
        }
        
        // 메인 페이지 UI를 설정하는 함수 호출
        setupMainPage()
    }
    
    
    /// 메인 페이지 UI를 설정하는 함수
    func setupMainPage() {
        
    }
    
}
