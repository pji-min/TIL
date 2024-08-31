package cond;

public class CondOp2 {

        public static void main(String[] args) {
            int age = 18;

            String status = (age >= 18) ? "성인" : "미성년자"; //? 참 : 거짓;

            System.out.println(status);
        }
    }

    //if문 보다 간결