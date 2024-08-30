package operator;

public class Operator2 {
    //문자열에도 플러스 연산자 사용이 가능하다
    public static void main(String[] args) {

        String result1 = "hello" + "world";
        System.out.println(result1);

        //변수로 더해도 됩니다
        String sum1 = "hello";
        String sum2 = "world";
        String result2 = sum1+sum2;

        System.out.println(result2);

        //문자열과 숫자 더하기
        String sum3 = "hello" + 30; //숫자를 문자열로 바꿔버림
        System.out.println(sum3);
    }
}
