import UIKit

class MainDetailPageComponents {

    static func createMainDetailComponentsView() -> UIStackView {
        
        let contentView = UIStackView()
        contentView.axis = .vertical
        contentView.spacing = 20
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // 1. "Who We Are" 섹션 (개별 UIView로 분리)
        let whoWeAreView = UIView()
        whoWeAreView.translatesAutoresizingMaskIntoConstraints = false
        
        let whoWeAreTitle = UILabel()
        whoWeAreTitle.text = "Who We Are"
        whoWeAreTitle.font = UIFont(name: "Pacifico-Regular", size: 24)
        whoWeAreTitle.textColor = UIColor(red: 108/255, green: 72/255, blue: 58/255, alpha: 1.0)
        whoWeAreTitle.textAlignment = .left
        
        let section1Label = UILabel()
        section1Label.numberOfLines = 0
        section1Label.textAlignment = .left
        section1Label.text = """
        - 우리는 Swift라는 전쟁터에 나선 5명의 전사곰🐻‍❄️🐻‍❄️🐻‍❄️🐻‍❄️🐻‍❄️과 1마리의 마스코트 곰탱이🐻입니다.
        - 말 수는 적어도 코드로 소통... 하려고 노력하는 편.
        - 앞으로 아마 가장 많이 하게 될 말은 “왜 안돼?”, “왜 돼?” 입니다.
        - iOS 개발의 정복! 이라는 소박한 꿈을 가지고 오늘도 사투를 벌이고 있습니다. 🔥🧨🔥
        """
        section1Label.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        whoWeAreView.addSubview(whoWeAreTitle)
        whoWeAreView.addSubview(section1Label)
        
        // Auto Layout for WhoWeAre view
        whoWeAreTitle.translatesAutoresizingMaskIntoConstraints = false
        section1Label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            whoWeAreTitle.topAnchor.constraint(equalTo: whoWeAreView.topAnchor, constant: 16),
            whoWeAreTitle.leadingAnchor.constraint(equalTo: whoWeAreView.leadingAnchor, constant: 20),
            whoWeAreTitle.trailingAnchor.constraint(equalTo: whoWeAreView.trailingAnchor, constant: -20),
            
            section1Label.topAnchor.constraint(equalTo: whoWeAreTitle.bottomAnchor, constant: 8),
            section1Label.leadingAnchor.constraint(equalTo: whoWeAreView.leadingAnchor, constant: 20),
            section1Label.trailingAnchor.constraint(equalTo: whoWeAreView.trailingAnchor, constant: -20),
            section1Label.bottomAnchor.constraint(equalTo: whoWeAreView.bottomAnchor, constant: -16)
        ])
        
        // 2. "How to Work Together" 섹션 (노란색 배경)
        let howToWorkView = UIView()
        howToWorkView.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0) // 노란색 배경
        howToWorkView.translatesAutoresizingMaskIntoConstraints = false
        
        let howToWorkTitle = UILabel()
        howToWorkTitle.text = "How to Work Together"
        howToWorkTitle.font = UIFont(name: "Pacifico-Regular", size: 24)
        howToWorkTitle.textColor = UIColor(red: 108/255, green: 72/255, blue: 58/255, alpha: 1.0)
        howToWorkTitle.textAlignment = .left
        
        let section2Label = UILabel()
        section2Label.numberOfLines = 0
        section2Label.textAlignment = .left
        section2Label.text = """
        - 자리를 오래 비울 때는 슬랙이나 팀 노션에 일정을 남겨주시고, 매니저님께 꼭 말해두기
        - 밥 맛있게 야무지게 잘 챙겨먹기.
        - 검색을 생활화하자~!
        - 할 일 빨리 처리하고 몰래몰래 딩가딩가 놀기
        - 매일 4시는 함께 프로젝트에 대한 논의를 나누고, 서로에 대해 피드백을 주고 받는 시간.
        """
        section2Label.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        howToWorkView.addSubview(howToWorkTitle)
        howToWorkView.addSubview(section2Label)
        
        // Auto Layout for HowToWork view
        howToWorkTitle.translatesAutoresizingMaskIntoConstraints = false
        section2Label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            howToWorkTitle.topAnchor.constraint(equalTo: howToWorkView.topAnchor, constant: 30),
            howToWorkTitle.leadingAnchor.constraint(equalTo: howToWorkView.leadingAnchor, constant: 20),
            howToWorkTitle.trailingAnchor.constraint(equalTo: howToWorkView.trailingAnchor, constant: -20),
            
            section2Label.topAnchor.constraint(equalTo: howToWorkTitle.bottomAnchor, constant: 8),
            section2Label.leadingAnchor.constraint(equalTo: howToWorkView.leadingAnchor, constant: 20),
            section2Label.trailingAnchor.constraint(equalTo: howToWorkView.trailingAnchor, constant: -20),
            section2Label.bottomAnchor.constraint(equalTo: howToWorkView.bottomAnchor, constant: -40)
        ])
        
        // 3. "Project Roles" 섹션 (볼드 처리)
        let projectRolesView = UIView()
        projectRolesView.translatesAutoresizingMaskIntoConstraints = false
        
        let projectRolesTitle = UILabel()
        projectRolesTitle.text = "Project Roles"
        projectRolesTitle.font = UIFont(name: "Pacifico-Regular", size: 24)
        projectRolesTitle.textColor = UIColor(red: 108/255, green: 72/255, blue: 58/255, alpha: 1.0)
        projectRolesTitle.textAlignment = .left
        
        let rolesTitle = UILabel()
        rolesTitle.text = "공동 작업"
        rolesTitle.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let rolesContent = UILabel()
        rolesContent.numberOfLines = 0
        rolesContent.text = "- 앱 및 콘텐츠 기획\n- 발표자료 키노트 기획"
        rolesContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let kimdongkol = UILabel()
        kimdongkol.text = "김동글"
        kimdongkol.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let kimdongkolContent = UILabel()
        kimdongkolContent.numberOfLines = 0
        kimdongkolContent.text = "- 김동글 멤버 화면 및 개인 자유화면 개발"
        kimdongkolContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let kimsangmin = UILabel()
        kimsangmin.text = "김상민"
        kimsangmin.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let kimsangminContent = UILabel()
        kimsangminContent.numberOfLines = 0
        kimsangminContent.text = "- 앱 디자인 적용 및 멤버 화면 템플릿 개발\n- 김상민 멤버 화면 및 개인 자유화면 개발"
        kimsangminContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let banseongjun = UILabel()
        banseongjun.text = "반성준"
        banseongjun.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let banseongjunContent = UILabel()
        banseongjunContent.numberOfLines = 0
        banseongjunContent.text = "- 앱 기본 구조 개발 및 배포\n- 프로젝트 레포지토리 및 폴더 관리\n- 반성준 멤버 화면 및 개인 자유화면 개발"
        banseongjunContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let seojimin = UILabel()
        seojimin.text = "서지민"
        seojimin.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let seojiminContent = UILabel()
        seojiminContent.numberOfLines = 0
        seojiminContent.text = "- 서지민 멤버 화면 및 개인 자유화면 개발"
        seojiminContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let imseongsu = UILabel()
        imseongsu.text = "임성수"
        imseongsu.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let imseongsuContent = UILabel()
        imseongsuContent.numberOfLines = 0
        imseongsuContent.text = "- 프로토타입 디자인\n- 임성수 멤버 화면 및 개인 자유화면 개발\n- 키노트 제작 및 발표"
        imseongsuContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let hanhyeonjun = UILabel()
        hanhyeonjun.text = "한현준"
        hanhyeonjun.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let hanhyeonjunContent = UILabel()
        hanhyeonjunContent.numberOfLines = 0
        hanhyeonjunContent.text = "- 한현준 멤버 화면 및 개인 자유화면 개발"
        hanhyeonjunContent.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        // Add all labels to projectRolesView
        projectRolesView.addSubview(projectRolesTitle)
        projectRolesView.addSubview(rolesTitle)
        projectRolesView.addSubview(rolesContent)
        projectRolesView.addSubview(kimdongkol)
        projectRolesView.addSubview(kimdongkolContent)
        projectRolesView.addSubview(kimsangmin)
        projectRolesView.addSubview(kimsangminContent)
        projectRolesView.addSubview(banseongjun)
        projectRolesView.addSubview(banseongjunContent)
        projectRolesView.addSubview(seojimin)
        projectRolesView.addSubview(seojiminContent)
        projectRolesView.addSubview(imseongsu)
        projectRolesView.addSubview(imseongsuContent)
        projectRolesView.addSubview(hanhyeonjun)
        projectRolesView.addSubview(hanhyeonjunContent)

        // Auto Layout for ProjectRoles view
        projectRolesTitle.translatesAutoresizingMaskIntoConstraints = false
        rolesTitle.translatesAutoresizingMaskIntoConstraints = false
        rolesContent.translatesAutoresizingMaskIntoConstraints = false
        kimdongkol.translatesAutoresizingMaskIntoConstraints = false
        kimdongkolContent.translatesAutoresizingMaskIntoConstraints = false
        kimsangmin.translatesAutoresizingMaskIntoConstraints = false
        kimsangminContent.translatesAutoresizingMaskIntoConstraints = false
        banseongjun.translatesAutoresizingMaskIntoConstraints = false
        banseongjunContent.translatesAutoresizingMaskIntoConstraints = false
        seojimin.translatesAutoresizingMaskIntoConstraints = false
        seojiminContent.translatesAutoresizingMaskIntoConstraints = false
        imseongsu.translatesAutoresizingMaskIntoConstraints = false
        imseongsuContent.translatesAutoresizingMaskIntoConstraints = false
        hanhyeonjun.translatesAutoresizingMaskIntoConstraints = false
        hanhyeonjunContent.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            projectRolesTitle.topAnchor.constraint(equalTo: projectRolesView.topAnchor, constant: 16),
            projectRolesTitle.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            projectRolesTitle.trailingAnchor.constraint(equalTo: projectRolesView.trailingAnchor, constant: -20),

            rolesTitle.topAnchor.constraint(equalTo: projectRolesTitle.bottomAnchor, constant: 16),
            rolesTitle.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            rolesContent.topAnchor.constraint(equalTo: rolesTitle.bottomAnchor, constant: 8),
            rolesContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),

            kimdongkol.topAnchor.constraint(equalTo: rolesContent.bottomAnchor, constant: 16),
            kimdongkol.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            kimdongkolContent.topAnchor.constraint(equalTo: kimdongkol.bottomAnchor, constant: 8),
            kimdongkolContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),

            kimsangmin.topAnchor.constraint(equalTo: kimdongkolContent.bottomAnchor, constant: 16),
            kimsangmin.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            kimsangminContent.topAnchor.constraint(equalTo: kimsangmin.bottomAnchor, constant: 8),
            kimsangminContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),

            banseongjun.topAnchor.constraint(equalTo: kimsangminContent.bottomAnchor, constant: 16),
            banseongjun.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            banseongjunContent.topAnchor.constraint(equalTo: banseongjun.bottomAnchor, constant: 8),
            banseongjunContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),

            seojimin.topAnchor.constraint(equalTo: banseongjunContent.bottomAnchor, constant: 16),
            seojimin.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            seojiminContent.topAnchor.constraint(equalTo: seojimin.bottomAnchor, constant: 8),
            seojiminContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),

            imseongsu.topAnchor.constraint(equalTo: seojiminContent.bottomAnchor, constant: 16),
            imseongsu.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            imseongsuContent.topAnchor.constraint(equalTo: imseongsu.bottomAnchor, constant: 8),
            imseongsuContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),

            hanhyeonjun.topAnchor.constraint(equalTo: imseongsuContent.bottomAnchor, constant: 16),
            hanhyeonjun.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            hanhyeonjunContent.topAnchor.constraint(equalTo: hanhyeonjun.bottomAnchor, constant: 8),
            hanhyeonjunContent.leadingAnchor.constraint(equalTo: projectRolesView.leadingAnchor, constant: 20),
            hanhyeonjunContent.bottomAnchor.constraint(equalTo: projectRolesView.bottomAnchor, constant: -16)
        ])
        
        // 4. "Tech Stack" 섹션 (노란색 배경과 볼드 처리 추가)
        let techStackView = UIView()
        techStackView.backgroundColor = UIColor(red: 254/255, green: 229/255, blue: 128/255, alpha: 1.0) // 노란색 배경
        techStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let techStackTitle = UILabel()
        techStackTitle.text = "Tech Stack"
        techStackTitle.font = UIFont(name: "Pacifico-Regular", size: 24)
        techStackTitle.textColor = UIColor(red: 108/255, green: 72/255, blue: 58/255, alpha: 1.0)
        techStackTitle.textAlignment = .left
        
        let techTitle1 = UILabel()
        techTitle1.text = "iOS Development with UIKit"
        techTitle1.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let techContent1 = UILabel()
        techContent1.numberOfLines = 0
        techContent1.text = "- UIView와 Auto Layout을 사용해 다양한 화면 크기에 맞춰 유연한 레이아웃을 구성합니다."
        techContent1.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let techTitle2 = UILabel()
        techTitle2.text = "MVC(Model-View-Controller) Pattern"
        techTitle2.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let techContent2 = UILabel()
        techContent2.numberOfLines = 0
        techContent2.text = "- Models, ViewController, UIComponents로 폴더를 나누어 관리할 예정"
        techContent2.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let techTitle3 = UILabel()
        techTitle3.text = "Code-based UI"
        techTitle3.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let techContent3 = UILabel()
        techContent3.numberOfLines = 0
        techContent3.text = "- 스토리보드 없이 코드로만 UI를 구성할 예정"
        techContent3.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        let techTitle4 = UILabel()
        techTitle4.text = "Swift"
        techTitle4.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        
        let techContent4 = UILabel()
        techContent4.numberOfLines = 0
        techContent4.text = "- iOS 앱 개발의 주 언어로 Swift를 사용할 예정"
        techContent4.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        
        // Add all labels to techStackView
        techStackView.addSubview(techStackTitle)
        techStackView.addSubview(techTitle1)
        techStackView.addSubview(techContent1)
        techStackView.addSubview(techTitle2)
        techStackView.addSubview(techContent2)
        techStackView.addSubview(techTitle3)
        techStackView.addSubview(techContent3)
        techStackView.addSubview(techTitle4)
        techStackView.addSubview(techContent4)
        
        // Auto Layout for TechStack view
        techStackTitle.translatesAutoresizingMaskIntoConstraints = false
        techTitle1.translatesAutoresizingMaskIntoConstraints = false
        techContent1.translatesAutoresizingMaskIntoConstraints = false
        techTitle2.translatesAutoresizingMaskIntoConstraints = false
        techContent2.translatesAutoresizingMaskIntoConstraints = false
        techTitle3.translatesAutoresizingMaskIntoConstraints = false
        techContent3.translatesAutoresizingMaskIntoConstraints = false
        techTitle4.translatesAutoresizingMaskIntoConstraints = false
        techContent4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            techStackTitle.topAnchor.constraint(equalTo: techStackView.topAnchor, constant: 30),
            techStackTitle.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techStackTitle.trailingAnchor.constraint(equalTo: techStackView.trailingAnchor, constant: -20),
            
            techTitle1.topAnchor.constraint(equalTo: techStackTitle.bottomAnchor, constant: 16),
            techTitle1.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent1.topAnchor.constraint(equalTo: techTitle1.bottomAnchor, constant: 8),
            techContent1.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent1.trailingAnchor.constraint(equalTo: techStackView.trailingAnchor, constant: -20),
            
            techTitle2.topAnchor.constraint(equalTo: techContent1.bottomAnchor, constant: 16),
            techTitle2.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent2.topAnchor.constraint(equalTo: techTitle2.bottomAnchor, constant: 8),
            techContent2.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent2.trailingAnchor.constraint(equalTo: techStackView.trailingAnchor, constant: -20),
            
            techTitle3.topAnchor.constraint(equalTo: techContent2.bottomAnchor, constant: 16),
            techTitle3.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent3.topAnchor.constraint(equalTo: techTitle3.bottomAnchor, constant: 8),
            techContent3.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent3.trailingAnchor.constraint(equalTo: techStackView.trailingAnchor, constant: -20),
            
            techTitle4.topAnchor.constraint(equalTo: techContent3.bottomAnchor, constant: 16),
            techTitle4.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent4.topAnchor.constraint(equalTo: techTitle4.bottomAnchor, constant: 8),
            techContent4.leadingAnchor.constraint(equalTo: techStackView.leadingAnchor, constant: 20),
            techContent4.trailingAnchor.constraint(equalTo: techStackView.trailingAnchor, constant: -20),
            techContent4.bottomAnchor.constraint(equalTo: techStackView.bottomAnchor, constant: -40)
        ])
        
        // UIStackView에 섹션들을 추가
        contentView.addArrangedSubview(whoWeAreView)
        contentView.addArrangedSubview(howToWorkView)
        contentView.addArrangedSubview(projectRolesView)
        contentView.addArrangedSubview(techStackView)
        
        return contentView
    }
}
