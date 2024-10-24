import Foundation

/// 데이터 로드를 담당하는 클래스
class DataManager {
    
    /// teamMember.json 파일에서 TeamMember 배열을 로드
    /// - Returns: TeamMember 객체 배열
    static func loadTeamMembers() -> [TeamMember]? {
        guard let url = Bundle.main.url(forResource: "teamMember", withExtension: "json") else {
            print("teamMember.json 파일 없음")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            // TeamMembersResponse 구조체로 디코딩
            let response = try decoder.decode(TeamMembersResponse.self, from: data)
            return response.teamMembers
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
