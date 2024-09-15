import UIKit
import SnapKit
import Then

class ScheduleViewController:UIViewController{
    
    let scheduleText = UILabel().then {
        $0.text = "시간표"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
    
    let dayView = UIView().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
    }
    
    let dayLabel = UILabel().then {
        $0.text = "2024/08/13 (화)"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    let tableView = UITableView().then {
        $0.register(TimeTableCell.self, forCellReuseIdentifier: "TimeTableCell")
        $0.separatorStyle = .none
        $0.rowHeight = 60
    }
    
    var timeTable: [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        
        layout()
        fetchTimetableData()
    }
    
    func layout() {
        [scheduleText, dayView, dayLabel, tableView].forEach { view.addSubview($0) }
        
        scheduleText.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            $0.centerX.equalToSuperview()
        }
        
        dayView.snp.makeConstraints {
            $0.top.equalTo(scheduleText.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(106)
            $0.height.equalTo(42)
        }
        
        dayLabel.snp.makeConstraints {
            $0.center.equalTo(dayView)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(dayView.snp.bottom).offset(20)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    func fetchTimetableData() {
        let apiKey = "541a529e9cad4deeb1742dfa136d4939"
        let apiUrl = "https://open.neis.go.kr/hub/hisTimetable"
        let type = "json"
        let pIndex = 1
        let pSize = 100
        let atptOfcdcScCode = "G10"
        let sdSchulCode = "7430310"

        let grade = "1"
        let classNum = "4"
//        let date = Date().toYYYYMMDD()
        let date = "20240916"
        
        guard var urlComponents = URLComponents(string: apiUrl) else { return }
        let query: [String: String] = [
            "KEY": apiKey,
            "Type": type,
            "pIndex": "\(pIndex)",
            "pSize": "\(pSize)",
            "ATPT_OFCDC_SC_CODE": atptOfcdcScCode,
            "SD_SCHUL_CODE": sdSchulCode,
            "GRADE": grade,
            "CLASS_NM": classNum,
            "ALL_TI_YMD": date
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

            if let responseString = String(data: data, encoding: .utf8) {
                print("서버 응답: \(responseString)")
            }

            if (200..<300).contains(statusCode) {
                do {
                    let timetableResponse = try JSONDecoder().decode(TimetableResponse.self, from: data)
                    
                    self.timeTable = timetableResponse.toEntity()
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
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
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableCell", for: indexPath) as? TimeTableCell else { return .init() }
        let (time, subject) = timeTable[indexPath.row]
        
        cell.timeLabel.text = time + "교시"
        cell.subjectLable.text = subject
        
        return cell
    }
}

extension Date {
    func toFormatString(_ string: String) -> String {
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = string
        return myDateFormatter.string(from: self)
    }
}
