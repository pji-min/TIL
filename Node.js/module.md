### 모듈이란?

> 모듈은 특정 기능을 수행하는 코드 묶음으로 다른 파일에서 재사용할 수 있습니다
> 
- 노드에서는 두 가지 형식의 모듈을 사용하는데  `CommonJS` 모듈과 `ECMAScript` 모듈이 있습니다

### Node.js에서 모듈을 불러오는 방법과 내보내는 방법

- 불러오는 방법

```jsx
const add = require('./math');  //불러오기
console.log(add(2, 3));  // 5 출력
```

- 내보내는 방법

```jsx
function add(a, b) {
  return a + b;
}

module.exports = add;  //내보내기
```
