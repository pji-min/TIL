package operator;

public class Comp2 {
    //문자열 비교
    //.equals 사용해야함

    public static void main(String[] args) {
        String str1 = "1";
        String str2 = "2";

        boolean result1 = "hello".equals("hello");
        boolean result2 = str1.equals(str1);
        boolean result3 = str1.equals(str2);

        System.out.println(result1);
        System.out.println(result2);
        System.out.println(result3);



    }
}

//리터럴 비교,문자열 변수 비교,리터럴-변수 비교 가능