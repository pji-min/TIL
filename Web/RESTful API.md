**REST API**란 **REST**를 기반으로 만들어진 API를 의미

---

### REST

Representational State Transfer의 약자로 자원을 이름으로 구분하여 해당 자원의 상태를 주고 받는 모든 것을 의미

- HTTP URI를 통해 자원을 명시함
- HTTP Method를 통해 해당 자원에 대한 CRUD Operation을 적용하는 것을 의미

---

### REST 구성 요소

1. 자원 : HTTP URI
2. 자원에 대한 행위 : HTTP Method
3. 자원에 대한 행위의 내용 : HTTP Message Pay Load

---

### REST의 특징

- Server - Client 구조
- Stateless
- Cacheable (캐시 처리 기능)
- Layered System (계층화)
- Uniform interface (인터페이스 일관성)

---

### REST의 장단점

**장점**

- HTTP 프로토콜의 인프라를 그대로 사용하므로 REST API 사용을 위한 별도의 인프라를 구축할 필요가 없음
- HTTP 프로토콜의 표준을 최대한 활용하여 여러 추가적인 장점을 함께 가져갈 수 있게 해줌
- HTTP 표준 프로토콜에 따르는 모든 플랫폼에서 사용 가능
- Hypermedia API의 기본을 충실히 지키면서 범용성 보장
- REST API 메세지가 의도하는 바를 명확하게 나타내므로 쉽게 파악 가능
- 여러 가지 서비스 디자인에서 생길 수 있는 문제를 최소화
- 서버와 클라이언트의 역할을 명확하게 분리

**단점**

- 표준 자체가 존재하지 않아 정의 필요
- HTTP Method 형태가 제한적
- 브라우저를 통해 테스트할 일이 많은 서비스라면 쉽게 고칠 수 있는 URL보다 Header 정보의 값을 처리해야 하므로 전문성 요구
- 구현 브라우저에서 호환이 되지 않아 지원해주지 못하는 동작

---

### 그래서 REST API란?

말 그대로 REST의 원리를 따르는 API를 의미

1. URI는 동사보다 명사를 대문자보다는 소문자를 사용해야한다

```markdown
Bad Example http://khj93.com/Running/
Good Example  http://khj93.com/run/  
```

1. 마지막에 슬래시 포함하지 않는다

```markdown
Bad Example http://khj93.com/test/  
Good Example  http://khj93.com/test
```

1. 언더바 대신 하이픈을 사용한다

```markdown
Bad Example http://khj93.com/test_blog
Good Example  http://khj93.com/test-blog  
```

1. 파일확장자는 URI에 포함하지 않는다

```markdown
Bad Example http://khj93.com/photo.jpg  
Good Example  http://khj93.com/photo  
```

1. 행위를 포함하지 않는다

```markdown
Bad Example http://khj93.com/delete-post/1  
Good Example  http://khj93.com/post/1  
```

- REST를 사용하였다해서 모두 **RESTful**한 것은 아님
- **설계 규칙**을 올바르게 지킨 시스템을 RESTful하다 말할 수 있음
