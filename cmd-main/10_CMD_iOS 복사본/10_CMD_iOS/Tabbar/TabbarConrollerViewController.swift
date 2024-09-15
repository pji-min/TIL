import UIKit

class TabbarConrollerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarLayout()
        setupTabbarItem()
    }

    func setupTabbarLayout() {
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.backgroundColor = UIColor(named: "mainColor")
    }

    func setupTabbarItem() {
        
        let ScheduleViewController = ScheduleViewController()
        ScheduleViewController.tabBarItem = UITabBarItem(
            title: "시간표",
            image: UIImage(named: "schedule"),
            selectedImage: UIImage(named: "schedule_selected")
        )
        ScheduleViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        ScheduleViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)

        let StudentViewController = StudentViewController()
        StudentViewController.tabBarItem = UITabBarItem(
            title: "학생 정보",
            image: UIImage(named: "student"),
            selectedImage: UIImage(named: "student_selected")
        )
        StudentViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        StudentViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)
        
        let MyPageViewController = MyPageViewController()
        MyPageViewController.tabBarItem = UITabBarItem(
            title: "마이페이지",
            image: UIImage(named: "myPage"),
            selectedImage: UIImage(named: "myPage_selected")
        )
        MyPageViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        MyPageViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)

        let NoticeViewController = NoticeViewController()
        NoticeViewController.tabBarItem = UITabBarItem(
            title: "공지",
            image: UIImage(named: "notification"),
            selectedImage: UIImage(named: "notification_selected")
        )
        NoticeViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        NoticeViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)
        
        let MealViewController = MealViewController()
        MealViewController.tabBarItem = UITabBarItem(
            title: "급식",
            image: UIImage(named: "meal"),
            selectedImage: UIImage(named: "meal_selected")
        )
        MealViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        MealViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)

        viewControllers = [
            ScheduleViewController,
            StudentViewController,
            MyPageViewController,
            NoticeViewController,
            MealViewController
        ]
    }
}
