import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView!
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.minimumInteritemSpacing = 21
        $0.minimumLineSpacing = 12
        $0.sectionInset = UIEdgeInsets(top: 16, left: 28, bottom: 16, right: 28)
        $0.itemSize = CGSize(width: 100, height: 100)
    }
    
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
        $0.text = "동아리를 불러오는 중..."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    private let seatText = UILabel().then {
        $0.text = "자리 배치"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    private var studentData: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
        view.backgroundColor = .white
        
        fetchStudentData()
    }
    
    private func fetchStudentData() {
        APIService.shared.fetchStudentData { [weak self] result in
            switch result {
            case .success(let student):
                DispatchQueue.main.async {
                    self?.studentData = student
                    self?.updateUIWithStudentData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showErrorAlert(message: "학생 정보를 불러오는 데 실패했습니다: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func updateUIWithStudentData() {
        guard let student = studentData else { return }
        
        userName.text = student.accountId
        userClassNumber.text = student.classNumber
        userBirth.text = student.birth
        userSpecialty.text = student.major
        userClub.text = student.club.isEmpty ? "동아리 정보 없음" : student.club
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .gray
            $0.dataSource = self
            $0.delegate = self
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
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
            clubText, userClub,
            seatText,
            collectionView
        ].forEach { view.addSubview($0) }
        
        myPageText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(79)
            $0.left.equalToSuperview().inset(43)
            $0.right.equalToSuperview().inset(133)
            $0.height.equalTo(60)
            $0.width.equalTo(217)
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
            $0.width.equalTo(343)
        }
        informationText.snp.makeConstraints {
            $0.top.equalTo(userInformation.snp.top).offset(34)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.height.equalTo(29)
        }
        nameText.snp.makeConstraints {
            $0.top.equalTo(informationText.snp.bottom).offset(34)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.height.equalTo(18)
        }
        userName.snp.makeConstraints {
            $0.top.equalTo(userInformation.snp.top).offset(98)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.height.equalTo(15)
        }
        classNumberText.snp.makeConstraints {
            $0.top.equalTo(nameText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.height.equalTo(18)
        }
        userClassNumber.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(13)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.height.equalTo(21)
        }
        birthText.snp.makeConstraints {
            $0.top.equalTo(classNumberText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.height.equalTo(18)
        }
        userBirth.snp.makeConstraints {
            $0.top.equalTo(userClassNumber.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.height.equalTo(21)
        }
        specialtyText.snp.makeConstraints {
            $0.top.equalTo(birthText.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.height.equalTo(21)
        }
        userSpecialty.snp.makeConstraints {
            $0.top.equalTo(userBirth.snp.bottom).offset(11)
            $0.left.equalTo(userInformation.snp.left).offset(138)
            $0.height.equalTo(21)
        }
        clubText.snp.makeConstraints {
            $0.top.equalTo(specialtyText.snp.bottom).offset(14)
            $0.left.equalTo(userInformation.snp.left).offset(30)
            $0.height.equalTo(18)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(seatText.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
