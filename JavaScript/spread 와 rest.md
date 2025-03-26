### spread

- 의미는 펼치다, 퍼뜨리다 입니다 이 문법을 사용해 객체 혹은 배열을 펼칠수있습니다

### 객체에서의 사용

```jsx
const slime = {
  name: '슬라임'
};

const cuteSlime = {
  ...slime, //spread 사용
  attribute: 'cute'
};

const purpleCuteSlime = {
  ...cuteSlime, //spread 사용
  color: 'purple'
};

console.log(slime);
console.log(cuteSlime);
console.log(purpleCuteSlime);
```

### 배열에서의 사용

```jsx
const numbers = [1, 2, 3, 4, 5];

const spreadNumbers = [...numbers, 1000, ...numbers]; //spread 사용
console.log(spreadNumbers); // [1, 2, 3, 4, 5, 1000, 1, 2, 3, 4, 5]
```

### rest

- 생김새는 `spread` 와 같은데 역할은 매우 다르다
- rest는 객체, 배열, 그리고 함수의 파라미터에서 사용이 가능합니다
