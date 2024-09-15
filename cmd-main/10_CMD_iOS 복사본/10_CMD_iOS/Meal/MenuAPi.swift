import UIKit

extension MenuViewController {
    
    func menu(title: String) {
        let parameters: [String: Any] = [
            "title": title
        ]
        
        guard let requestBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Failed to serialize request body")
            return
        }
        
        guard let url = URL(string: "http://43.201.199.73:8080") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response: \(String(describing: response))")
                return
            }
            
            print("HTTP Status Code: \(httpResponse.statusCode)")
            
            switch httpResponse.statusCode {
            case 200..<300:
                // Success
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("Response JSON: \(responseString)")
                }
            case 400..<500:
                // Client error
                print("Client error: \(httpResponse.statusCode)")
            case 500..<600:
                // Server error
                print("Server error: \(httpResponse.statusCode)")
            default:
                print("Unexpected status code: \(httpResponse.statusCode)")
            }
        }.resume()
    }
}
