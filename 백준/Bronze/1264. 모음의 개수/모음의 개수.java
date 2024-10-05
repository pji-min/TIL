import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String a = "aeiouAEIOU";

        while (true) {
            String abc = scanner.nextLine();

            if (abc.equals("#")) {
                break;
            }

            int count = 0;
            for (int i = 0; i < abc.length(); i++) {
                if (a.indexOf(abc.charAt(i)) != -1) {
                    count += 1;
                }
            }

            System.out.println(count);
        }
    }
}
