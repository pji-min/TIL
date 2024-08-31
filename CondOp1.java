package cond;

public class CondOp1 {
    public static void main(String[] args) {
        int age = 18;

        String status;

        if (age >= 18) {
            status = "성인";
        } else {
            status = "미성년자";
        }

        System.out.println(status);
    }
}

//참과 거짓에 따라 변수의 값이 달라짐