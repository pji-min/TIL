package cond;

public class If4 {
    public static void main(String[] args) {
        int age = 7;
        int price =10000;
        int discount = 0;

        if (price >= 10000) {
            discount = discount+1000;
        }

        if (age <= 10) {
            discount = discount+1000;
        }

        System.out.println(discount);
    }
}

//여러 조건이더라도 항상 if else는 아님
//독립 조건일땐 if 만