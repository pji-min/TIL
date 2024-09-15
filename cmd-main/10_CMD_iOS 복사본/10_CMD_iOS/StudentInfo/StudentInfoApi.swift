import Foundation

struct UserResponse: Codable {
    let accountId: String
}

func fetchUserList(completion: @escaping ([UserResponse]) -> Void) {
    let endpoint = "http://43.201.199.73:8080/user"
    
    guard let url = URL(string: endpoint) else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Network error: \(error)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response")
            return
        }
        
        switch httpResponse.statusCode {
        case 200:
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let userResponse = try JSONDecoder().decode([UserResponse].self, from: data)
                completion(userResponse)
            } catch {
                print("Error decoding response data: \(error)")
            }
            
        default:
            print("statusCode: \(httpResponse.statusCode)")
        }
    }.resume()
}
