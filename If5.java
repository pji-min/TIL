package cond;

public class If5 {
    public static void main(String[] args) {
        int age = 7;
        int price =10000;
        int discount = 0;

        if (price >= 10000) {
            discount = discount+1000;
        }else if (age <= 10) {
            discount = discount+1000;
        }

        System.out.println(discount);
    }
}
//하나의 조건이 맞는다면 그다음으로 안넘어가서 1000원 할인만 들어간다