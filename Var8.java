package variable;

public class Var8 {
    public static void main(String[] args) {


        //정수

        byte b = 127; //-128 ~ 127
        short s = 4727; // -32,768 ~ 32,767
        int i = 372897343; //-2,147,483,648 ~ 2,147,483,647 (약 20억), 기본

        long l = 74582784789547575L; //완전 많이 , 대문자 L을 붙어야함
        //-9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,887

        //음 그럼 그냥 long 사용하지 굳이 생각해야해?
        //-> 표현 범위에 따라 메모리 공간을 차지해서 맞는 타입을 쓰는것이 👍
        //실수

        float f = 12437.0f;
        double d = 3838.0d; //기본
    }
}
 //실무에서 거의 사용하지 않는 것
// byte(단, 파일을 바이트 단위로 다루기에 전송 복사에 주로 사용됨), short, float(표현 길이, 정밀도 낮음), char
//자주 사용
//int, long, double, boolean, String