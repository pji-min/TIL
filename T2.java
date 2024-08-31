package cond;

public class T2 {
    public static void main(String[] args) {
        int distance = 100;

        String tra = switch (distance){
            case 1 -> "도보";
            case 10 -> "자전거";
            case 100 -> "자동차";
            default -> "비행기";
        };

        System.out.println(tra+"를 이용하세요.");
    }
}