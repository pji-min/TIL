package operator;

public class Assign1 {
    //i = i+4 -> i +=4 , 코드를 축약해줘서 좋다!!!
    public static void main(String[] args) {
        int a = 5;
        a += 3;
        a -= 2;
        a *= 4;
        a /= 3;
        a %= 5;

        System.out.println(a);
    }
}
