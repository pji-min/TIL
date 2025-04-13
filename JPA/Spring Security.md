### Spring Security

- Spring 기반의 애플리케이션의 보안을 담당하는 스프링 하위 프레임워크
- 인증과 인가에 대한 부분을 Filter 흐름에 따라 처리

### 사용 과정

1. 인증
    - 사용자가 인증 정보를 제공
2. 권한 부여
    - 인증된 사용자에 한하여 리소스에 접근할 권한을 부여함
3. 필터 체인
    - Servlet 필터 기반의 보안 기능을 제공
4. 보안 컨텍스트
    - 현재 사용자의 보안 정보를 저장하고 관리
5. 액세스 결정 및 보안 이벤트 처리
    - Spring Security는 액세스 결정을 수행하여 사용자의 요청에 대한 접근 권한을 확인

### 구조 흐름

인증 요청 → 필터 → AuthenticationManager → UserDetailsService → 인증 성공 후 SecurityContext에 저장
