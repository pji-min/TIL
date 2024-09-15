import Foundation

struct UserInfoResponse: Decodable {
    let accountId: String
    let phonenumber: String
    let major: String
    let email: String
    let classNumber: String
    let birth: String
}

class MyPageManager {
    static let shared = MyPageManager()

    private init() {}

    func fetchUserInfo(completion: @escaping (UserInfoResponse) -> Void) {
        let urlString = "http://43.201.199.73:8080/user/myinfo"
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { return }

            guard let data = data else { return }

            do {
                let userInfo = try JSONDecoder().decode(UserInfoResponse.self, from: data)
                completion(userInfo)
            } catch {
                print("디코딩 오류: \(error)")
            }
        }.resume()
    }
}
