import Foundation

class NoticeManager {
    static let shared = NoticeManager()

    private init() {}

    func fetchNotices(completion: @escaping ([Notice]) -> Void) {
        let urlString = "http://43.201.199.73:8080/notification"
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return
            }

            guard let data = data else {
                return
            }

            do {
                let notices = try JSONDecoder().decode([Notice].self, from: data)
                completion(notices)
            } catch {
                print("디코딩 오류: \(error)")
            }
        }.resume()
    }

    func fetchNotice(notificationId: String, completion: @escaping (Notice?, Error?) -> Void) {
        let urlString = "http://43.201.199.73:8080/notices/\(notificationId)"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "유효하지 않은 URL", code: 400, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "데이터 없음", code: 404, userInfo: nil))
                return
            }

            do {
                let notice = try JSONDecoder().decode(Notice.self, from: data)
                completion(notice, nil)
            } catch {
                print("디코딩 오류: \(error)")
                completion(nil, error)
            }
        }.resume()
    }
}
