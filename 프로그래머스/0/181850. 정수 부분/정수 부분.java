class Solution {
    public int solution(double flo) {
        int answer = 0;

        int floor = (int) Math.floor(flo);
        answer += floor;
        
        return answer;
    }
}