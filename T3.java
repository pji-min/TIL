package cond;

public class T3 {
    public static void main(String[] args) {
        int distance = 10;
        String  tra;

        if(distance <= 1){
            tra = "도보";
        } else if(distance <= 10){
            tra = "자전거";
        } else if(distance <= 100){
            tra = "자동차";
        } else{
            tra = "비행기";
        }

        System.out.println(tra+"를 이용하세요.");
    }
}
