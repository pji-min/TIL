import UIKit
import SnapKit
import Then

class NoticeContentsViewController: UIViewController {
    
    let noticeTitle = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 23, weight: .bold)
    }
    
    let noticeDate = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    }
    
    let line = UIImageView().then {
        $0.backgroundColor = .lightGray
    }
    
    let noticeContents = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 13, weight: .light)
        $0.numberOfLines = 0
    }

    var notice: Notice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        self.title = "공지"
        if let notice = notice {
            noticeTitle.text = notice.title
            noticeContents.text = notice.content
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: notice.createdTime)
            noticeDate.text = date?.toFormatString("yyyy년 MM월 dd일")
        } else {
            noticeTitle.text = "공지 데이터가 없습니다."
            noticeContents.text = "이 공지의 세부사항을 사용할 수 없습니다."
        }
    }
    
    func layout() {
        [
            noticeTitle,
            noticeDate,
            line,
            noticeContents
        ].forEach { view.addSubview($0) }
        
        noticeTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
            $0.height.equalTo(28)
        }
        
        noticeDate.snp.makeConstraints {
            $0.top.equalTo(noticeTitle.snp.bottom).offset(7)
            $0.left.equalToSuperview().inset(20)
            $0.height.equalTo(12)
        }
        
        line.snp.makeConstraints {
            $0.top.equalTo(noticeDate.snp.bottom).offset(16)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        noticeContents.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(21)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
        }
    }
}
