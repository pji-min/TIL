import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    var accountId: String?
    var password: String?
    var confirmPassword: String?

    let mainLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "회원가입"
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    }
    
    let subLabel = UILabel().then {
        $0.textColor = .textField
        $0.text = "새로운 계정을 만들어요~"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .thin)
    }
    
    let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 18
        $0.addLeftPadding()
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.cornerRadius = 18
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let checkPasswordTextField = UITextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.layer.cornerRadius = 18
        $0.layer.borderColor = UIColor.textField.cgColor
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.addLeftPadding()
    }
    
    let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.layer.cornerRadius = 18
        $0.backgroundColor = .textField
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(signUpButtonTap), for: .touchUpInside)
    }
    
    let loginButton = UIButton().then {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.setTitle("로그인 하기", for: .normal)
        $0.setTitleColor(.textField, for: .normal)
        $0.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
    }
    
    @objc func signUpButtonTap() {
        guard let accountId = idTextField.text, !accountId.isEmpty else {
            print("아이디를 입력하세요.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("비밀번호를 입력하세요.")
            return
        }
        guard let confirmPassword = checkPasswordTextField.text, !confirmPassword.isEmpty else {
            print("비밀번호 확인을 입력하세요.")
            return
        }
        if password != confirmPassword {
            print("비밀번호가 일치하지 않습니다.")
            return
        }
        
        self.accountId = accountId
        self.password = password
        self.confirmPassword = confirmPassword
        
        signUp()
    }
    
    @objc func loginButtonTap() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func signUp() {
        let url = URL(string: "http://43.201.199.73:8080/auth/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        guard let accountId = self.accountId, let password = self.password else {
            print("계정 ID와 비밀번호가 필요합니다.")
            return
        }
        
        
        let params: [String: String] = [
            "accountId": accountId,
            "password": password,
            "email": "1",
            "phonenumber": "1",
            "major": "1",
            "classNumber": "1",
            "birth": "1"
        ]
        
        //print(params)

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error: \(error)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("요청 실패: \(error)")
                return
            }

            guard let data = data else {
                print("데이터가 없습니다.")
                return
            }

            
            if let responseString = String(data: data, encoding: .utf8) {
                print("서버 응답: \(responseString)")
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            if (200..<300).contains(statusCode) {
                do {
                    let token = try JSONDecoder().decode(TokenResponse.self, from: data)
                    print("회원가입 성공: \(token.accessToken)")

                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
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
        view.addSubview(checkPasswordTextField)
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(136)
            $0.left.equalToSuperview().inset(43)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(48)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(80)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(25)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        checkPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
            $0.left.equalToSuperview().inset(38)
            $0.right.equalToSuperview().inset(36)
            $0.height.equalTo(55)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(checkPasswordTextField.snp.bottom).offset(120)
            $0.left.equalToSuperview().inset(44)
            $0.right.equalToSuperview().inset(44)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
}
