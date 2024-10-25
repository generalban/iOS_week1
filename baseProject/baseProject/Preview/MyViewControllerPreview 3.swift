// MyViewControllerPreview.swift
// baseProject
//
// Created by Jamong on 10/23/24.
//

import SwiftUI

// SwiftUI Preview를 통해 UIKit ViewController 미리보기
struct MyViewControllerPreview3: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            MainDetailViewController()
        }
        .edgesIgnoringSafeArea(.all) // 전체 화면 미리보기로 설정
    }
}

// SwiftUI의 UIViewControllerRepresentable을 사용해 UIKit 뷰를 SwiftUI에서 사용
struct ViewControllerPreview3<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: ViewController
    
    init(_ builder: @escaping () -> ViewController) {
        self.viewController = builder()
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // UI 업데이트 필요 시 여기에 작성
    }
}
