import UIKit
import SnapKit
import Then

struct Notice: Codable {
    let title: String
    let content: String
    let createdTime: String
}

class NoticeCell: UITableViewCell {
    static let identifier = "NoticeCell"
    
    private let noticeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    private let dateLabel = UILabel().then {
        $0.textColor = .noticeDate
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    private let background = UIView().then {
        $0.backgroundColor = .noticeBG
        $0.layer.cornerRadius = 15
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUI() {
        addSubview(background)
        background.addSubview(noticeLabel)
        background.addSubview(dateLabel)
        background.snp.makeConstraints {
            $0.height.equalTo(62)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        noticeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }

        dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(6)
        }
    }

    func configure(with notice: Notice) {
        noticeLabel.text = notice.title
        dateLabel.text = notice.createdTime
    }
}

class NoticeViewController: UIViewController {

    private let noticeText = UILabel().then {
        $0.text = "공지"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }

    private let subView = UIView().then {
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }

    private let subLabel = UILabel().then {
        $0.text = "주요 공지 확인 하러 가기!"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .center
    }

    private let line = UIView().then {
        $0.backgroundColor = .lightGray
    }

    private let tableView = UITableView().then {
        $0.register(NoticeCell.self, forCellReuseIdentifier: NoticeCell.identifier)
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.rowHeight = 81
    }

    private var notices: [Notice] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white

        tableView.delegate = self
        tableView.dataSource = self

        fetchNotices()
    }

    private func layout() {
        [
            noticeText,
            subView,
            subLabel,
            line,
            tableView
        ].forEach { view.addSubview($0) }

        noticeText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(18)
        }

        subView.snp.makeConstraints {
            $0.top.equalTo(noticeText.snp.bottom).offset(22)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(43)
        }

        subLabel.snp.makeConstraints {
            $0.center.equalTo(subView.snp.center)
        }

        line.snp.makeConstraints {
            $0.top.equalTo(subView.snp.bottom).offset(15)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }

    private func fetchNotices() {
        NoticeManager.shared.fetchNotices() { [weak self] notices in
            guard let self else { return }

            self.notices = notices

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.identifier, for: indexPath) as? NoticeCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none

        let notice = notices[indexPath.row]
        cell.configure(with: notice)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let notice = notices[indexPath.row]
        
        let noticeContentsVC = NoticeContentsViewController()
        noticeContentsVC.notice = notice
        
        navigationController?.pushViewController(noticeContentsVC, animated: true)
    }
}
