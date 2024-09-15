import UIKit
import SnapKit
import Then

struct Stu: Codable {
    let accountId: String
    let phonenumber: String
    let major: String
    let email: String
    let classNumber: String
    let birth: String
}

class MyPageViewController: UIViewController {
    
    private let myPageText = UILabel().then {
        $0.text = "마이페이지"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    }
    
    private let line = UIImageView().then {
        $0.image = UIImage(named: "Line")
    }
    
    private let userInformation = UIImageView().then {
        $0.image = UIImage(named: "information")
    }
    
    private let informationText = UILabel().then {
        $0.text = "회원 정보"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    private let nameText = UILabel().then {
        $0.text = "이름"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    private let userName = UILabel().then {
        $0.text = "이름을 불러오는 중..."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let classNumberText = UILabel().then {
        $0.text = "학번"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    private let userClassNumber = UILabel().then {
        $0.text = "학번을 불러오는 중..."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let birthText = UILabel().then {
        $0.text = "생년월일"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    private let userBirth = UILabel().then {
        $0.text = "생년월일을 불러오는 중..."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let specialtyText = UILabel().then {
        $0.text = "전공"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    private let userSpecialty = UILabel().then {
        $0.text = "전공을 불러오는 중..."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let clubText = UILabel().then {
        $0.text = "전공 동아리"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    private let userClub = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    private var studentData: Stu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
        fetchStudentData()
    }
    
    private func fetchStudentData() {
        let accountId = "V"
        let url = URL(string: "http://43.201.199.73:8080/user/\(accountId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    print("API 요청 오류: \(error)")
                    self?.showErrorAlert(message: "네트워크 오류가 발생했습니다.")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self?.showErrorAlert(message: "데이터를 받을 수 없습니다.")
                }
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                DispatchQueue.main.async {
                    self?.showErrorAlert(message: "응답 상태를 확인할 수 없습니다.")
                }
                return
            }
            
            if (200..<300).contains(statusCode) {
                do {
                    let student = try JSONDecoder().decode(Stu.self, from: data)
                    DispatchQueue.main.async {
                        self?.studentData = student
                        self?.updateUIWithStudentData()
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("디코딩 오류: \(error)")
                        self?.showErrorAlert(message: "데이터 형식 오류가 발생했습니다.")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    print("상태 코드: \(statusCode)")
                    if statusCode == 404 {
                        self?.showErrorAlert(message: "유저 아이디를 찾을 수 없습니다.")
                    } else if statusCode == 400 {
                        self?.showErrorAlert(message: "잘못된 요청입니다.")
                    } else {
                        self?.showErrorAlert(message: "알 수 없는 오류가 발생했습니다.")
                    }
                }
            }
        }
        
        task.resume()
    }
    
    private func updateUIWithStudentData() {
        guard let student = studentData else { return }
        
        userName.text = student.accountId
        userClassNumber.text = student.classNumber
        userBirth.text = student.birth
        userSpecialty.text = student.major
//        userClub.text = student.club.isEmpty ? "동아리 정보 없음" : student.club
    }
    
    private func setupLayout() {
        [
            myPageText,
            line,
            userInformation,
            informationText,
            nameText, userName,
            classNumberText, userClassNumber,
            birthText, userBirth,
            specialtyText, userSpecialty,
            clubText, userClub
        ].forEach { view.addSubview($0) }
        
        myPageText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(79)
            $0.left.equalToSuperview().inset(43)
            $0.right.equalToSuperview().inset(133)
            $0.height.equalTo(60)
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(myPageText.snp.bottom).offset(26)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        userInformation.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(25)
            $0.height.equalTo(535)
        }
        
        informationText.snp.makeConstraints {
            $0.top.equalTo(userInformation.snp.top).offset(34)
            $0.left.equalTo(userInformation.snp.left).offset(30)
        }
        
        nameText.snp.makeConstraints {
            $0.top.equalTo(informationText.snp.bottom).offset(34)
            $0.left.equalTo(userInformation.snp.left).offset(30)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalTo(userInformation.snp.top).offset(98)
            $0.left.equalTo(userInformation.snp.left).offset(138)
        }
        
        classNumberText.snp.makeConstraints {
            $0.top.equalTo(nameText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
        }
        
        userClassNumber.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(13)
            $0.left.equalTo(userInformation.snp.left).offset(138)
        }
        
        birthText.snp.makeConstraints {
            $0.top.equalTo(classNumberText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
        }
        
        userBirth.snp.makeConstraints {
            $0.top.equalTo(userClassNumber.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(138)
        }
        
        specialtyText.snp.makeConstraints {
            $0.top.equalTo(birthText.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(30)
        }
        
        userSpecialty.snp.makeConstraints {
            $0.top.equalTo(userBirth.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(138)
        }
        
        clubText.snp.makeConstraints {
            $0.top.equalTo(specialtyText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
        }
        
        userClub.snp.makeConstraints {
            $0.top.equalTo(clubText.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(138)
        }
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
