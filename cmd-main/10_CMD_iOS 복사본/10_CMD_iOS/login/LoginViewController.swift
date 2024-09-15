import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    let mainLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "로그인"
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    }
    
    let subLabel = UILabel().then {
        $0.textColor = .gray
        $0.text = "기존 계정으로 로그인 하세요~"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .thin)
    }
    
    let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.borderColor = UIColor.gray.cgColor 
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 18
        $0.addLeftPadding()
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.cornerRadius = 18
        $0.layer.borderColor = UIColor.gray.cgColor // Or define UIColor.textField
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 18
        $0.backgroundColor = .textField // Or define UIColor.textField
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
    }
    
    let signUpButton = UIButton().then {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("회원가입 하기", for: .normal)
        $0.setTitleColor(.textField, for: .normal)
        $0.addTarget(self, action: #selector(signUpButtonTap), for: .touchUpInside)
    }
    
    @objc func signUpButtonTap() {
        let nextView = SignUpViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    @objc func loginButtonTap() {
        guard let accountId = idTextField.text, !accountId.isEmpty else {
            print("아이디를 입력하세요.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("비밀번호를 입력하세요.")
            return
        }
        login()
    }
    
    func login() {
        let url = URL(string: "http://43.201.199.73:8080/auth/signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let accountId = idTextField.text, let password = passwordTextField.text else {
            print("아이디와 비밀번호가 필요합니다.")
            return
        }
        
        let params = [
            "accountId": accountId,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("요청 실패: \(error)")
                return
            }
            
            guard let data = data else {
                print("데이터가 없습니다.")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            if (200..<300).contains(statusCode) {
                do {
                    let token = try JSONDecoder().decode(TokenResponse.self, from: data)
                    print("로그인 성공: \(token.accessToken)") // Adjust this according to your needs
                    accessToken = token.accessToken

                    DispatchQueue.main.async {
                        let mainVC = UINavigationController(rootViewController: TabbarConrollerViewController())
                        mainVC.modalPresentationStyle = .fullScreen
                        self.present(mainVC, animated: true)
                    }
                } catch {
                    print("디코딩 오류: \(error)")
                }
            } else {
                print("상태 코드: \(statusCode)")
            }
        }
        
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(180)
            $0.left.equalToSuperview().inset(43)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(48)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(100)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(27)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(100)
            $0.left.equalToSuperview().inset(44)
            $0.right.equalToSuperview().inset(44)
            $0.height.equalTo(55)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
        }
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
