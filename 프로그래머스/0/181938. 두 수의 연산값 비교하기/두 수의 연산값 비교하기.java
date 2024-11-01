class Solution {
    public int solution(int a, int b) {


        String str1 = String.valueOf(a);
        String str2 = String.valueOf(b);


        int num1 = Integer.parseInt(str1+str2);
        int num2 = 2*a*b;
        
        if(num1 > num2){
            return num1;
        } else if(num1 < num2){
            return num2;
        } else {
            return num1;
        }
    }
}