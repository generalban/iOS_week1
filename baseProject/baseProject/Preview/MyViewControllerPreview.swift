// MyViewControllerPreview.swift
// baseProject
//
// Created by Jamong on 10/23/24.
//

import SwiftUI

// SwiftUI Preview를 통해 UIKit ViewController 미리보기
struct MyViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            // 전체 멤버 리스트 생성
            let allMembers = [
                TeamMember(
                    name: "김상민",
                    mbti: "INFJ",
                    role: "Developer",
                    bio: "저는 예비 iOS 개발자 입니다.",
                    imageName: "🐻",
                    blogUrl: "https://tistory.com",
                    githubUrl: "https://github.com/",
                    mainBio: "얍",
                    cards: [
                        Card(title: "두번째 카드", content: "첫번째 카드의 내용은 주절 주절 주절"),
                        Card(title: "첫번쨰 카드", content: "두번째 카드의 내용은 주절 주절 주절")
                    ]
                ),
                TeamMember(
                    name: "누굴까",
                    mbti: "INFJ",
                    role: "디자이너",
                    bio: "디자이너",
                    imageName: "🐶",
                    blogUrl: "https://tistory.com",
                    githubUrl: "https://github.com/",
                    mainBio: "얍",
                    cards: [
                        Card(title: "두번째 카드", content: "첫번째 카드의 내용은 주절 주절 주절"),
                        Card(title: "첫번쨰 카드", content: "두번째 카드의 내용은 주절 주절 주절")
                    ]
                )
            ]
            
            // 첫 번째 멤버로 TeamMemberViewController 초기화
            return TeamMemberViewController(member: allMembers[0], allMembers: allMembers)
        }
        .edgesIgnoringSafeArea(.all) // 전체 화면 미리보기로 설정
    }
}

// SwiftUI의 UIViewControllerRepresentable을 사용해 UIKit 뷰를 SwiftUI에서 사용
struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    
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
