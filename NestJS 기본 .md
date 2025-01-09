# 왜 NestJS는 javascript 보다 typescript를 선호할까?

> 기본적으로 NestJS에는 typescript가 내장되어 있습니다 javascript를 사용하고 싶다면 별도의 컴파일러 등을 설치해야할 수도 있기 때문입니다

### 그 외에도

- type 안전성, 더 나은 개발 경험, NestJS에 최적화된 지원
- 코드 품질 향상, 개발 효율성 높임

# NestJS 설정을 해보자~

> Nest CLI를 사용하면 더 쉽다 npm을 설치하면 터미널에 명령어로 새로운 프젝을 만들 수 있어요~

```markdown
$ npm i -g @nestjs/cli
$ nest new project-name
```

## 이렇게 프로젝트를 만들면

- 디렉토리가 생성되고 노드 모듈과 몇 가지 다른 보일러플레이트 파일이 설치되고, `src/`디렉토리가 생성되어 여러 핵심 파일로 채워진다

```markdown
src
app.controller.spec.ts
app.controller.ts
app.module.ts
app.service.ts
main.ts
```

## 각각 소개를 해보자면!!!

1. app.controller.spec.ts
   - 단일 경로를 갖춘 기본 컨트롤러
2. app.controller.ts
   - 컨트롤러에 대한 단위테스트
3. app.module.ts
   - 애플리케이션의 루트 모듈
4. app.service.ts
   - 기본 서비스
5. main.ts
   - `NestFactory`Nest 애플리케이션 인스턴스를 생성하기 위해 코어 함수를 사용하는 애플리케이션의 입력 파일

# 애플리케이션 실행

```markdown
$ npm run start
```

이 코드를 사용하여 실행할 수 있다

```markdown
$ npm run start:dev
```

수정사항이 있을 때 서버를 다시 컴파일하고 다시 로드합니다