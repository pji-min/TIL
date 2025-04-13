### Spring Security Filter Chain의 역할

> 보안과 관련된 모든 처리를 Servlet 전에 미리 가로채서 수행
> 
- Servlet이란?
    
    자바로 만든 웹 요청/응답 처리용 서버 측 프로그램
    
- 인증, 인가, 세션 관리, CORS, CSRF 등 **보안 관련 로직을 필터 단에서 처리**
- 요청이 컨트롤러에 도달하기 전에 보안 검증이 다 끝남

---

### 대표적인 Filter Chain 예

| 필터명 | 설명 |
| --- | --- |
| `SecurityContextPersistenceFilter` | 이전 요청의 인증 정보(SecurityContext)를 불러오고 저장 |
| `UsernamePasswordAuthenticationFilter` | 로그인 요청을 감지하고 인증 처리 시도 |
| `BasicAuthenticationFilter` | HTTP Basic 인증 처리 |
| `ExceptionTranslationFilter` | 인증/인가 실패 시 예외 처리 (→ 로그인 페이지 리디렉션 등) |
| `FilterSecurityInterceptor` | 최종적으로 인가(권한 검사)를 담당 |

---

### 동작 순서 요약

```
요청
 ↓
[ Spring Security Filter Chain ]
 ↓
DispatcherServlet
 ↓
Controller
 ↓
응답
```

---

### 정리

> Spring Security Filter Chain은 DispatcherServlet 이전에 동작하며 인증/인가 등 보안 처리를 담당하는 여러 개의 필터로 구성된 체인임
>
