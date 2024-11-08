class Solution {
    public String solution(String rny_string) {


        StringBuilder answer = new StringBuilder();


        for(int i = 0; i < rny_string.length(); i++) {
            if(rny_string.charAt(i) == 'm') {
                answer.append("rn");
            } else{
                answer.append(rny_string.charAt(i));
            }
        }
        return answer.toString();
    }
}