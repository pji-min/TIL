package operator;

public class OperatorAdd2 {

    public static void main(String[] args) {
        //전위
        int a = 1;
        int b = 0;

        b = ++a; //여기서 먼저 증가
        System.out.println("a =" +a+ ", b = " +b);

        //후위
        int c = 1;
        int d = 0;

        d = c++;
        System.out.println("c =" +c+ ", d = " +d); //여기서 증가

        ++a;
        System.out.println("a =" +a);
        a++;
        System.out.println("a =" +a); //단독으로 쓰면 나오는 값은 =
    }
}
//++a : 전위 증감 연산자
//a++ : 후위 증감 연산자