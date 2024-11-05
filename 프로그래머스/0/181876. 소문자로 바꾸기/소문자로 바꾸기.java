class Solution {
    public String solution(String myString) {
        StringBuilder answer = new StringBuilder();
        
        for (int i = 0; i < myString.length(); i++) {
            answer.append(Character.toLowerCase(myString.charAt(i)));
        }
        
        return answer.toString();
    }
}
