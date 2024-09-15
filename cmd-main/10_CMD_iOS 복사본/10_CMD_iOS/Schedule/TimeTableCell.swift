import UIKit
import SnapKit
import Then

class TimeTableCell: UITableViewCell {
    let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 25, weight: .semibold)
    }
    let subjectLable = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .light)
        $0.textAlignment = .center
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        [timeLabel, subjectLable].forEach(addSubview(_:))
        timeLabel.snp.makeConstraints {
            $0.width.equalTo(71)
            $0.height.equalTo(37)
            $0.top.leading.equalToSuperview()
        }
        subjectLable.snp.makeConstraints {
            $0.leading.equalTo(timeLabel.snp.trailing).offset(8)
            $0.trailing.top.equalToSuperview()
            $0.height.equalTo(49)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
