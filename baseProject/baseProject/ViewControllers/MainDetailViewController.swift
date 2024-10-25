// MainDetailViewController.swift
// 메인 디테일 팀 페이지를 관리하는 ViewController
// 작성자: Jamong
// 작성일: 2024-10-24

import UIKit

class MainDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupMainDetailPage()
    }
    
    func setupMainDetailPage() {
        // 스크롤뷰 생성
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // MainDetailPageComponents에서 contentView 생성
        let contentView = MainDetailPageComponents.createMainDetailComponentsView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)  // contentView를 scrollView에 추가
        
        // 스크롤뷰와 컨텐츠뷰 제약 설정
        NSLayoutConstraint.activate([
            // ScrollView 제약
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // contentView 제약
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
