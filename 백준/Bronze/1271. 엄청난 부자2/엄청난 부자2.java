import java.math.BigInteger;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        BigInteger n = scan.nextBigInteger();
        BigInteger m = scan.nextBigInteger();

        BigInteger divide = n.divide(m);
        BigInteger remainder = n.remainder(m);

        System.out.println(divide);
        System.out.println(remainder);
    }
}