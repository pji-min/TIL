### 소개

- Java 14, 15에서 Preview 기능으로 도입
- Java 16부터 정식 스펙으로 포함됨
- 특정 값(Value) 타입을 간결하게 표현할 때 사용
- Kotlin의 `data class`와 유사

---

### 주요 특징

- **불변(immutable)** 데이터 표현에 특화됨
- 생성자 및 주요 메서드 자동 생성
    - `constructor()`
    - `toString()`
    - `equals()`
    - `hashCode()`

---

### 사용 예시

```java
public record User(String name, int age) {}
```

- 위 코드만으로도 `User` 객체 생성, 비교, 출력 등 대부분 기능 지원됨
- `name`과 `age`는 자동으로 `private final` 필드로 처리됨
