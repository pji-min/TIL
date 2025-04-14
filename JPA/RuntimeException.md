**RuntimeException**

- `java.lang.RuntimeException`은 자바 **JVM의 정상적인 작동 중**에 발생할 수 있는 예외의 **슈퍼 클래스**
- 체크하지 않아도 되는 예외(unchecked exception)로, 컴파일러가 예외 처리(try-catch 또는 throws)를 강제하지 않음
- 주로 **프로그래머의 실수**로 인해 발생하는 경우가 많음
    - 잘못된 인덱스 접근, null 객체 참조 등

---

- **서브 클래스**는 다음과 같음
    - `NullPointerException`
    - `ArrayIndexOutOfBoundsException`
    - `IllegalArgumentException`
    - `ArithmeticException`
    - `ClassCastException`
    - 등등
- 주로 **메서드나 생성자의 실행 중** 발생하며 외부 환경보다는 **코드의 논리적 오류**에 의해 발생함
- 예외 처리를 강제하지 않지만 발생 가능성이 있는 경우 **개발자가 직접 예외 처리를 해주는 것이 좋음**
