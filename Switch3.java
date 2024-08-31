package cond;

public class Switch3 {
    public static void main(String[] args) {
        int grade = 2;
        int coupon;

        switch (grade) {
            case 1:
                coupon = 1000;
                break;

            case 2: //break;가 없어 3 실행
            case 3:
                coupon = 3000;
                break;
            default:
                coupon = 500;
        }
        System.out.println(coupon);
    }
}
