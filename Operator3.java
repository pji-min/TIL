package operator;

public class Operator3 {

    public static void main(String[] args) {
        int sum1 = 1 + 2 * 3; //나눗셈이 우선순위 높음
        int sum2 = (1 + 2) * 3; //괄호가 우선순위 높음

        System.out.println(sum1);
        System.out.println(sum2);
    }
}
