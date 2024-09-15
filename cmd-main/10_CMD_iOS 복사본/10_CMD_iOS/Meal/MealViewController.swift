import UIKit
import Then
import SnapKit

// MARK: - ViewController
class MealViewController: UIViewController {
    
    let titleLabel = UILabel().then {
        $0.text = "급식"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .center
    }
    
    let subView = UIView().then {
        $0.layer.borderColor = UIColor.subView.cgColor
        $0.layer.borderWidth = 4
        $0.layer.cornerRadius = 20
    }
    
    let line = UIView().then {
        $0.backgroundColor = .meal
    }
    
    let subLabel = UILabel().then {
        $0.text = "오늘의 급식"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .center
    }
    
    let dayView = UIView().then {
        $0.layer.borderColor = UIColor.dayView.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
    }
    
    let dayLabel = UILabel().then {
        $0.text = "날짜"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    let scrollView = UIScrollView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 330, height: 660)
        $0.backgroundColor = .meal
        $0.layer.cornerRadius = 15
    }
    
    let contentView = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 330, height: 660)
        $0.backgroundColor = .meal
        $0.layer.cornerRadius = 15
    }
    
    let breakLabel = UILabel().then {
        $0.text = "아침"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
    }
    
    let breakMenuLabel = UILabel().then {
        $0.text = "메뉴"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)
        $0.textColor = .menu
        $0.numberOfLines = 0
    }
    
    let breakCalLabel = UILabel().then {
        $0.text = "칼로리"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        $0.textColor = .black
    }
    
    let lunchLabel = UILabel().then {
        $0.text = "점심"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
    }
    
    let lunchMenuLabel = UILabel().then {
        $0.text = "메뉴"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)
        $0.textColor = .menu
        $0.numberOfLines = 0
    }
    
    let lunchCalLabel = UILabel().then {
        $0.text = "칼로리"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        $0.textColor = .black
    }
    
    let dinLabel = UILabel().then {
        $0.text = "저녁"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
    }
    
    let dinMenuLabel = UILabel().then {
        $0.text = "메뉴"
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)
        $0.textColor = .menu
        $0.numberOfLines = 0
    }
    
    let dinCalLabel = UILabel().then {
        $0.text = "칼로리"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        $0.textColor = .black
    }
    
    let plusButton = UIButton().then {
        $0.setImage(UIImage(named: "PlusButton"), for: .normal)
        $0.addTarget(nil, action: #selector(plusButtonTap), for: .touchUpInside)
    }
    
    @objc func plusButtonTap() {
        let nextView = MenuViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(subView)
        view.addSubview(subLabel)
        view.addSubview(dayView)
        view.addSubview(dayLabel)
        view.addSubview(scrollView)
        view.addSubview(plusButton)
        view.addSubview(line)
        contentView.addSubview(breakLabel)
        contentView.addSubview(breakMenuLabel)
        contentView.addSubview(breakCalLabel)
        contentView.addSubview(lunchLabel)
        contentView.addSubview(lunchMenuLabel)
        contentView.addSubview(lunchCalLabel)
        contentView.addSubview(dinLabel)
        contentView.addSubview(dinMenuLabel)
        contentView.addSubview(dinCalLabel)
        scrollView.addSubview(contentView)
        
        view.backgroundColor = .white
        
        setupConstraints()
        fetchMealData()
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68)
            $0.left.right.equalToSuperview().inset(157)
        }
        
        subView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(43)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(subView.snp.top).inset(7)
            $0.bottom.equalTo(subView.snp.bottom).inset(7)
            $0.left.equalTo(subView.snp.left).inset(133)
            $0.right.equalTo(subView.snp.right).inset(133)
        }
        
        dayView.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(37)
            $0.right.left.equalToSuperview().inset(106)
            $0.height.equalTo(42)
        }
        
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(dayView.snp.top).inset(14)
            $0.right.equalTo(dayView.snp.right).inset(46)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(155)
            $0.right.left.equalToSuperview().inset(32)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualTo(700)
        }
        
        breakLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(41)
            $0.left.equalTo(contentView.snp.left).inset(33)
        }
        
        breakMenuLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(43)
            $0.left.equalTo(contentView.snp.left).inset(97)
        }
        
        breakCalLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(150)
            $0.left.equalTo(contentView.snp.left).inset(107)
        }
        
        lunchLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(268)
            $0.left.equalTo(contentView.snp.left).inset(33)
        }
        
        lunchMenuLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(270)
            $0.left.equalTo(contentView.snp.left).inset(97)
        }
        
        lunchCalLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(377)
            $0.left.equalTo(contentView.snp.left).inset(107)
        }
        
        dinLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(495)
            $0.left.equalTo(contentView.snp.left).inset(33)
        }
        
        dinMenuLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(497)
            $0.left.equalTo(contentView.snp.left).inset(97)
        }
        
        dinCalLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(604)
            $0.left.equalTo(contentView.snp.left).inset(107)
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(716)
            $0.left.equalToSuperview().inset(328)
            $0.height.equalTo(47)
            $0.width.equalTo(47)
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(80)
            $0.left.equalToSuperview().inset(0)
            $0.right.equalToSuperview().inset(0)
            $0.height.equalTo(1)
            $0.width.equalTo(393)
        }
    }
    
    // API 호출 및 디버그용 JSON 응답 출력
    func fetchMealData() {
        let apiKey = "541a529e9cad4deeb1742dfa136d4939"
        let apiUrl = "https://open.neis.go.kr/hub/mealServiceDietInfo"
        let type = "json"
        let pIndex = 1
        let pSize = 100
        let atptOfcdcScCode = "G10"
        let sdSchulCode = "7430310"
//        let date = Date().toYYYYMMDD()
        let date = "20240919"
        
        guard var urlComponents = URLComponents(string: apiUrl) else { return }
        let query: [String: String] = [
            "KEY": apiKey,
            "Type": type,
            "pIndex": "\(pIndex)",
            "pSize": "\(pSize)",
            "ATPT_OFCDC_SC_CODE": atptOfcdcScCode,
            "SD_SCHUL_CODE": sdSchulCode,
            "MLSV_YMD": date
        ]
        let queryItemArray = query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlComponents.queryItems = queryItemArray
        guard let url = urlComponents.url else { return }
        print(url)

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                print("Failed to get status code")
                return
            }
            
            if (200..<300).contains(statusCode) {
                do {
                    // API 응답을 문자열로 출력하여 구조 확인
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("JSON Response: \(jsonString)")
                    }
                    
                    let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                    print("Meal data: \(mealResponse)")
                    
                    DispatchQueue.main.async {
                        self.updateUI(with: mealResponse)
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else {
                print("HTTP status code: \(statusCode)")
            }
        }
        
        task.resume()
    }
    
    // UI 업데이트 함수
    func updateUI(with response: MealResponse) {
        let entity = response.toEntity()
        let cal = response.toCal()
        breakMenuLabel.text = entity.breakfast
        breakCalLabel.text = cal.breakfast
        
        lunchMenuLabel.text = entity.lunch
        lunchCalLabel.text = cal.lunch
        
        dinMenuLabel.text = entity.dinner
        dinCalLabel.text = cal.dinner
    }
}
