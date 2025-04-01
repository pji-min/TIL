### REPL이란 무엇인가?

Node.js에서 제공하는 Read-Eval-Print-Loop의 약자로, 사용자가 입력한 코드를 실행하고 결과를 출력하는 환경입니다

### REPL의 주요 기능

1. **Read(읽기)**: 사용자가 입력한 코드를 읽습니다
2. **Eval(실행)**: 입력된 코드를 평가하여 실행합니다
3. **Print(출력)**: 실행 결과를 출력합니다
4. **Loop(반복)**: 다음 입력을 기다리며 루프를 계속합니다

### REPL 사용법

Mac에서는 터미널을 열고 `node` 를 입력하면 됩니다

```jsx
> console.log("Hello");
Hello
undefined  // 반환값 출력
```

### REPL의 필요성

- 개발자들이 소스 코드 실행 결과를 빨리 확인해야 할 경우 사용
- 더 나은 단위 테스트를 위해 사용
    - 간단한 JavaScript 코드 테스트
    - Node.js API 실험 (파일 시스템, HTTP 등)
    - 변수 값 확인 및 디버깅
    - 즉석에서 함수 및 로직 테스트

### REPL에서 실행 시 결과는?

```jsx
> 1 + 1
2

> console.log('Hello, Node.js!')
Hello, Node.js!
undefined

> let x = 5; x * 2;
10
```
