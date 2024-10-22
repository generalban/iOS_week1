//
//  TeamListViewController.swift
//  baseProject
//
//  Created by 반성준 on 10/22/24.
//

import UIKit

class TeamListViewController: UIViewController {

    private let team = Team(
        name: "Amazing Team",
        description: "이 팀은 최고의 프로젝트를 만듭니다.",
        goal: "세계를 변화시키는 것을 목표로 합니다.",
        members: [
            TeamMember(name: "호날두", mbti: "ENFP", role: "프론트엔드 개발자", bio: "UI/UX 전문가.", imageName: "profile1"),
            TeamMember(name: "메시", mbti: "ISTJ", role: "백엔드 개발자", bio: "서버와 API 담당.", imageName: "profile2")
            // 추가 팀원
        ]
    )

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "팀 소개"
        view.backgroundColor = .white
        
        setupTableView()
        setupTeamInfoView()
    }
    
    // 팀 소개 정보 레이아웃 설정
    private func setupTeamInfoView() {
        let teamInfoStackView = UIStackView()
        teamInfoStackView.axis = .vertical
        teamInfoStackView.alignment = .fill
        teamInfoStackView.spacing = 10
        teamInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let teamNameLabel = UILabel()
        teamNameLabel.text = team.name
        teamNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        teamNameLabel.textAlignment = .center
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = team.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        let goalLabel = UILabel()
        goalLabel.text = "목표: \(team.goal)"
        goalLabel.textAlignment = .center
        
        teamInfoStackView.addArrangedSubview(teamNameLabel)
        teamInfoStackView.addArrangedSubview(descriptionLabel)
        teamInfoStackView.addArrangedSubview(goalLabel)
        
        view.addSubview(teamInfoStackView)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            teamInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            teamInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            teamInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    // 팀원 목록을 위한 테이블 뷰 설정
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "memberCell")
        view.addSubview(tableView)
        
        // 테이블뷰 Auto Layout 설정
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150), // 팀 정보 아래에 테이블뷰 배치
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TeamListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        let member = team.members[indexPath.row]
        cell.textLabel?.text = member.name
        cell.imageView?.image = UIImage(named: member.imageName)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.layer.cornerRadius = 25
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = team.members[indexPath.row]
        let memberVC = TeamMemberViewController(member: member)
        navigationController?.pushViewController(memberVC, animated: true)
    }
}
