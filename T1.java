package cond;

public class T1 {
    public static void main(String[] args) {
        int score = 80;
        char unit;

        if (score >= 90) {
            unit = 'A';
        } else if (score >= 80) {
            unit = 'B';
        } else if (score >= 70) {
            unit = 'C';
        } else if (score >= 60) {
            unit = 'D';
        } else {
            unit = 'F';
        }

        System.out.println("학점은 "+unit+"입니다.");
    }
}
