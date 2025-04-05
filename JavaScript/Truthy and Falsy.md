## Truthy / Falsy

> 자바스크립트 문법은 아니지만, 알아두면 오류 방지 및 간결한 조건문 처리에 큰 도움이 됩니다!
> 

---

### 🟢 Truthy란?

`true`처럼 **조건문에서 true로 평가되는 값**

### 🔴 Falsy란?

`false`처럼 **조건문에서 false로 평가되는 값**

---

### Falsy 값 목록

자바스크립트에서 **false로 취급되는 값들**은 다음과 같습니다:

```jsx
false, 0, '', null, undefined, NaN
```

---

### 예시: 값이 주어지지 않아 오류가 나는 경우

```jsx
function print(person) {
  console.log(person.name);
}

const person = {
  name: 'John'
};

print(); // TypeError: Cannot read property 'name' of undefined
```

→ `person`이 `undefined`이기 때문에 `.name`을 읽을 수 없어 오류 발생!

---

### 해결 방법: 조건문으로 체크

```jsx
function print(person) {
  if (person === undefined) {
    return;
  }
  console.log(person.name);
}
```

하지만 `null`일 경우도 따로 처리해야 함

```jsx
function print(person) {
  if (person === undefined) {
    console.log('person이 없네요');
    return;
  }
  console.log(person.name);
}

const person = null;
print(person); // ❌ TypeError 발생
```

---

### 더 좋은 방법: Falsy 체크로 간단히!

```jsx
function print(person) {
  if (!person) {
    console.log('person이 없네요');
    return;
  }
  console.log(person.name);
}

```

→ `null`과 `undefined`를 모두 **간결하게 처리** 가능!

(심지어 `false`, `0`, `''`, `NaN`까지도 감지 가능)

---

### Falsy 값 확인 예제

```jsx
console.log(!3); // false (Truthy)
console.log(!'hello'); // false (Truthy)
console.log(!['array?']); // false (Truthy)
console.log(![]); // false (Truthy)
console.log(!{ value: 1 }); // false (Truthy)

console.log(!null); // true (Falsy)
console.log(!undefined); // true (Falsy)
console.log(!0); // true (Falsy)
```

---

정확하게 말하자면 **Falsy 값을 Truthy로 "변경"하는 게 아니라,** 그 값을 **Boolean으로 변환한 뒤 반대로 뒤집는 것**

- `!` : **반대값을 얻을 때**
- `!!` : **진짜 Boolean 값이 필요할 때** (예: 조건 확인, 필터링 등)
