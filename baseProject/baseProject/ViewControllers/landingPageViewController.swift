// landingPageViewController.swift
// 첫 화면 ViewController
// 작성자: Jamong
// 작성일: 2024-10-25

import UIKit

class LandingPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0) // 노란 배경 설정

        setupLandingPage()  // 화면 구성 함수 호출
    }

    // 화면을 구성하는 함수
    func setupLandingPage() {
        // 이미지 버튼 생성
        let imageButton = UIButton()
        imageButton.setImage(UIImage(named: "Logo"), for: .normal)  // "Logo" 이미지를 사용하여 버튼 설정
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 이미지 라벨을 UIImageView로 생성
        let imageTextView = UIImageView(image: UIImage(named: "LogoText"))
        imageTextView.translatesAutoresizingMaskIntoConstraints = false
        
        // 버튼 눌렀을 때 액션 추가
        imageButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)

        // 버튼과 라벨을 뷰에 추가
        view.addSubview(imageButton)
        view.addSubview(imageTextView)

        // 레이아웃 제약 추가
        NSLayoutConstraint.activate([
            // 이미지 버튼 레이아웃 설정
            imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40), // 화면 중앙에서 조금 위로

            // 이미지 텍스트(LogoText)의 레이아웃 설정
            imageTextView.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 23),
            imageTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // 이미지 버튼이 눌렸을 때 호출되는 함수
    @objc func imageButtonTapped() {
        // MainPageViewController로 이동
        let mainPageVC = MainPageViewController()
        let navigationController = UINavigationController(rootViewController: mainPageVC) // MainPageViewController를 NavigationController로 감쌈
        navigationController.modalPresentationStyle = .fullScreen  // 전체 화면으로 표시
        self.present(navigationController, animated: false, completion: nil)  // 애니메이션 없이 화면 전환
    }
}
