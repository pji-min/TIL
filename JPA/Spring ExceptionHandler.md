Controller 계층에서 발생하는 에러를 잡아서 메서드로 처리해주는 기능

- Service, Repository에서 발생하는 에러는 제외

```java
@Controller
public class SimpleController {

    // ...

    @ExceptionHandler
    public ResponseEntity<String> handle(IOException ex) {
        // ...
    }
}
```

### 여러개의 Exception 처리

`@ExceptionHandler`의 `value` 값으로 어떤 Exception을 처리할 것인지 넘겨 줄 수 있는데 `value` 를 설정하지 않는다면 모든 Exception을 잡게 되기 때문에 구체적으로 적어주는 것이 좋다
