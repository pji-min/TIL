### CommonJS 모듈

CommonJS 모듈은 표준 자바스크립트 모듈은 아니지만 노드 생태계에서 가장 널리 쓰이는 모듈입니다

❓ : 왜 표준이 아닌데도 널리 쓰이는 거죠?

❗️ : 표준이 나오기 이전부터 쓰였기 때문

### CommonJS의 모듈을 불러오는 방법과 내보내는 방법

- 내보내는 방법

```jsx
const odd = '홀수'
const even = '짝수'

module.export = {
	odd,
	even,
};
```

- 불러오는 방법

```jsx
const { odd, even ] = require('./var');

function checkOddOrEven(num) {
	if (num % 2) {
		return ood;
	}
	return even;
}

module.exports = checkOddOrEven;
```

### ECMAScript 모듈

ECMAScript 모듈은 공식적인 자바스크립트 모듈 형식입니다

- 브라우저에서도 ES 모듈을 사용할 수 있어 브라우저와 노드 모두에 같은 모듈 형식을 사용 할 수 있다는 것이 장점

### ECMAScript의 모듈을 불러오는 방법과 내보내는 방법

- 내보내는 방법

```jsx
export function add(a, b) {
  return a + b;
}
```

- 불러오는 방법

```jsx
import { add } from './math.mjs';  // 모듈 가져오기
console.log(add(2, 3));  // 5
```

### CommonJS vs ES 모듈 주요 차이점

- **CommonJS**는 **동기적 로딩** → `require()`를 실행하면 즉시 모듈이 로드함
- **ES 모듈**은 **비동기적 로딩** → `import`는 실행 전 정적으로 분석함
