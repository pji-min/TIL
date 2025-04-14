### CORS의 등장 배경

일단 SOP를 알아야한다

→ SOP : 2011년 RFC 6454에서 등장한 보안 정책으로 **같은 출처에서만 리소스를 공유할 수 있다** 라는 규칙을 가진 정책

- 보안도 당연히 중요하지만 개발을 하다보면 어쩔 수 없이 다른 출처와 상호작용을 해야함
- 이런 경우를 대비하여 몇 가지 예외 조항을 두고 이 조항에 해당하는 리소스는 출처가 다르더라도 허용
- 그 중 하나가 CORS 정책을 지킨 리소스 요청임

---

### 그러면 CORS가 뭐지?

CORS란 도메인이 **다른 서버끼리 리소스를 주고 받을 때 보안**을 위해 설정된 정책

- 브라우저에 구현된 보안 정책으로 서버는 응답을 보내더라도 브라우저가 이를 차단함
- 예시
    - 웹 사이트 A가 API 서버 B에 요청할 때, B에 CORS 설정이 없다면 브라우저가 요청을 거부함
    - 프론트엔드와 백엔드를 각각 다른 서버(예: React 3000번, SpringBoot 8080번)에서 띄우면 포트가 달라 다른 출처로 간주되어 CORS 에러가 발생

---

### Origin

→ 그렇다면 다른 출처와 같은 출처의 구분은 어떻게 하는 것이 좋을까?

Origin은 프로토콜, 호스트, 포트 번호를 모두 포함한 웹 요청의 출처를 의미함

---

### Cross-Origin

일반적으로는 **same-origin**이란 scheme(프로토콜), host(도메인), 포트가 같다는 말이며 이 3가지 중 하나라도 다르면 **cross-origin임**

---

### 1. **Simple Request**

- **일반적인 요청**: CORS 정책 검사를 하지 않음
- **조건**:
    - **HTTP 메소드**: GET, HEAD, POST 중 하나
    - **허용된 요청 헤더**:
        - Accept, Accept-Language, Content-Language, Content-Type (application/x-www-form-urlencoded, multipart/form-data, text/plain만 허용)
        - 요청에 커스텀 헤더나 Authorization 헤더가 포함되면 CORS 검사가 이루어짐
    - XMLHttpRequestUpload 객체에서 이벤트 리스너가 등록되지 않음
- **주의 사항**: 실제 애플리케이션에서는 Content-Type에 `application/json` 등을 사용하기 때문에 **Simple Request는 드물게 발생**

### 2. **Preflight Request**

- **Preflight 요청**: CORS 검사를 위해 먼저 OPTIONS 메소드로 예비 요청을 보냄
- **흔한 상황**:
    - GET 외 다른 메소드(POST, PUT 등)
    - **비단순 헤더** 사용 (예: Authorization)
    - **Content-Type**이 `application/json` 같은 비허용 MIME 타입일 때
- **응답 헤더** 예시:
    - `Access-Control-Allow-Origin: https://example.com`
    - `Access-Control-Allow-Methods: POST, GET, OPTIONS`
    - `Access-Control-Allow-Headers: X-PINGOTHER, Content-Type`
    - `Access-Control-Max-Age: 86400` (캐싱 시간)
- **브라우저 행동**: Preflight 응답에서 CORS 정책이 허용되면 본 요청을 보냄
    - **캐싱**을 활용하여 효율성 증가 가능

### 3. **Credential Request**

- **인증된 요청**: 쿠키나 토큰 등 인증 정보가 포함된 요청
- **조건**:
    - 요청에 인증 정보가 포함되면 서버에서 `Access-Control-Allow-Credentials: true` 헤더를 포함해야 함
- **옵션 값**:
    - `same-origin`: 같은 출처 간 요청만 인증 정보 허용
    - `include`: 모든 요청에 인증 정보 포함
    - `omit`: 인증 정보 포함 안 함
- **특이 사항**: `Access-Control-Allow-Origin`에 를 사용할 수 없으며, 명시적인 Origin URL이 필요함

### 4. **Postman CORS 문제 발생 안 함**

- **Postman**과 같은 도구는 **브라우저가 아니므로 CORS 정책이 적용되지 않음**
- **Cross-Origin 요청**이지만 브라우저에서 요구하는 CORS 체크가 없기 때문에 발생하지 않음

### 5. **주의 사항**

- Preflight 요청에서 응답이 200이라 하더라도 **`Access-Control-Allow-Origin`** 값이 적절히 설정되어야 CORS 오류가 발생하지 않음
- **예비 요청 실패 시**에도 응답에 적절한 CORS 헤더가 포함되어 있으면 CORS 정책 위반이 아님

---

### CORS 에러 해결 방법

- Access-Control-Allow-Origin 세팅하기
    - 서버에서 **`Access-Control-Allow-Origin`** 헤더에 알맞은 값을 세팅 (* 와일드 카드 사용 시 보안 이슈 발생)
- Webpack Dev Server로 리버스 프록싱하기
    - 로컬 개발 환경에서 프론트엔드와 백엔드 간 CORS 문제를 해결하려면, 웹팩의 프록시 기능을 사용하여 브라우저가 다른 출처로 요청을 보내는 것처럼 처리 (단 로컬에서만)
