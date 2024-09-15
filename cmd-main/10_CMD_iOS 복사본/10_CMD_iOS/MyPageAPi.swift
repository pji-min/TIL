import Foundation

struct Student: Decodable {
    let accountId: String
    let major: String
    let classNumber: String
    let birth: String
    let club: String
}

class APIService {
    
    static let shared = APIService()
    private init() {}
    
    func fetchStudentData(completion: @escaping (Result<Student, Error>) -> Void) {
        guard let url = URL(string: "http://43.201.199.73:8080/user/myinfo") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "잘못된 URL입니다."])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "데이터가 없습니다."])))
                return
            }
            
            do {
                let student = try JSONDecoder().decode(Student.self, from: data)
                completion(.success(student))
            } catch {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "데이터 디코딩 실패"])))
            }
        }
        
        task.resume()
    }
}
