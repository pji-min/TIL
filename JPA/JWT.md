**JWT(JSON Web Token)**는 사용자 **인증 정보**를 안전하게 전송하기 위한 **JSON 기반의 웹 토큰**

---

### JWT의 구조

- 헤더, 내용, 서명이 .(dot)을 구분자로 하여 JWT 토큰 1개를 이룸

```markdown
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

---

### **HEADER:ALGORITHM & TOKEN TYPE**

인코딩 : Base64

```markdown
{
  "alg": "HS256",
  "typ": "JWT"
}
```

- 해시 알고리즘과 토큰의 타입 정의

### **PAYLOAD:DATA**

```markdown
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022
}
```

- 전달하는 데이터를 포함할 수 있음
- claim은 사용자가 원하는 Key와 Value로 구성 가능
- claim
    
    토큰에 담긴 정보나 데이터를 의미
    
    - registered, public, private

❗️ **주의점**

<aside>
페이로드는 서명된 부분이 아니기에 디코딩 시 데이터 열람이 가능함 (민감한 정보 포함 x)

</aside>

### **VERIFY SIGNATURE**

- 해시 : HMAC SHA 256

```markdown
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  secret
)
```

- Base64로 인코딩된 헤더, 페이로드, secret이 필요
- secret은 말 그대로 유저가 지정하는 비밀코드임
