import UIKit
import SnapKit
import Then

class StudentViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var students: [String] = []
    var collectionView: UICollectionView!
    let studentImage = UIImage(resource: .studentCollection)

    let titleLabel = UILabel().then {
        $0.text = "학생정보"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .center
    }

    let subView = UIView().then {
        $0.layer.borderColor = UIColor.subView.cgColor
        $0.layer.borderWidth = 4
        $0.layer.cornerRadius = 20
    }

    let subLabel = UILabel().then {
        $0.text = "1-1"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textAlignment = .center
    }

    let line = UIView().then {
        $0.backgroundColor = .meal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        fetchUserList { res in
            self.students = res.map { $0.accountId }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

        let layout = UICollectionViewFlowLayout().then {
            $0.minimumInteritemSpacing = 17
            $0.minimumLineSpacing = 30
            $0.sectionInset = UIEdgeInsets(top: 74, left: 24, bottom: 0, right: 24)
            $0.itemSize = CGSize(width: 73, height: 71)
        }

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.backgroundColor = .white
            $0.dataSource = self
            $0.delegate = self
            $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }

        view.addSubview(titleLabel)
        view.addSubview(subView)
        view.addSubview(subLabel)
        view.addSubview(line)
        view.addSubview(collectionView)
        
        
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68)
            $0.centerX.equalToSuperview()
        }

        subView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(43)
        }

        subLabel.snp.makeConstraints {
            $0.center.equalTo(subView)
        }

        line.snp.makeConstraints {
            $0.top.equalTo(subView.snp.bottom).offset(65)
            $0.left.right.equalToSuperview().inset(1)
            $0.height.equalTo(1)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        let imageView = UIImageView(image: studentImage).then {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }

        cell.contentView.subviews.forEach { $0.removeFromSuperview()
        }
        cell.contentView.addSubview(imageView)
        
        
        let label = UILabel().then {
            $0.text = students[indexPath.row]
        }
        cell.contentView.addSubview(label)

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(73)
            $0.height.equalTo(71)
        }

        label.snp.makeConstraints {
            $0.centerX.equalTo(imageView)
            $0.top.equalTo(imageView.snp.bottom).offset(2)
        }

        return cell
    }
}

