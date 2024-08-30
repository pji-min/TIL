package operator;

public class OperatorAdd1 {
    public static void main(String[] args) {
        int a =0;

        a = a+1;
        System.out.println(a); //1

        a = a+1;
        System.out.println(a); //2

        //증감 연산자 제공

        ++a;
        System.out.println(a);
        ++a;
        System.out.println(a);

        --a;
        System.out.println(a);

    }
}

//a=a+1을 ++a로 간단히 표현할 수 있다!!!
//하나 감소 시엔 --a