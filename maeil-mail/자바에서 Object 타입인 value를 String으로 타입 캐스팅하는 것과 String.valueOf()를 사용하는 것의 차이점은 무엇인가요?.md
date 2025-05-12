### `(String) value` 명시적 타입 캐스팅

- `value`가 실제로 `String` 타입인 경우에만 성공
- `value`가 `String`이 아니면 `ClassCastException` 발생
- `value`가 `null`이면 `null`이 그대로 반환되며, 이후 메서드 호출 시 `NullPointerException` 위험이 있음

```java
Object value = 123;
String str = (String) value;  // ClassCastException 발생
```

---

### `String.valueOf(value)` 안전한 문자열 변환

- `value`가 `null`이면 `"null"`이라는 문자열 반환
- `value`가 `String`이 아니면 `value.toString()`을 호출
- `null`에 안전하며 런타임 캐스팅 예외가 없음

```java
Object value = 123;
String str = String.valueOf(value);  // "123" 반환
```
---

### 결론

`Object` 타입의 값을 문자열로 변환할 때는 **`String.valueOf()`를 사용하는 것이 훨씬 안전하고 일반적인 방식**
