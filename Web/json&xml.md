### JSON

- 자바 스크립트 객체 표기법으로 데이터를 전달할 때 사용하는 표준 형식
- ECMAScript5부터 기본으로 JSON이 내장 되고 있기 때문에 XML보다 JSON을 더 많이 사용하는 추세
- 자바스크립트뿐만 아니라 C, C++, Java, Python 등 여러 프로그래밍 언어에서 많이 사용되고 있는 데이터 형식

```json
[
	{
            "name" : "진",
            "group" : "방탄소년단",
            "birth" : 1992,
            "age" : 31,
            "debut" : 2013
        },
        {
            "name" : "RM",
            "group" : "방탄소년단",
            "birth" : 1994,
            "age" : 29,
            "debut" : 2013
        }
]
```

---

### XML

- HTML 형식과 같은 태그로 데이터를 표현하는 방식의 마크업 언어
- HTML 태그처럼 미리 지정되어있지 않고 사용자가 직접 정의
- 데이터가 어떤 것을 의미하는지 직관적으로 알 수 있지만 여는 태그와 닫는 태그로 이루어져 용량을 많이 차지

```xml
<?xml version="1.0" encoding="utf-8"?>
<idols>
    <idol>
        <name>진</name>
        <group>방탄소년단</group>
        <birth>1992</birth>
        <age>31</age>
        <debut>2013</debut>
    </idol>
    <idol>
        <name>RM</name>
        <group>방탄소년단</group>
        <birth>1994</birth>
        <age>29</age>
        <debut>2013</debut>
    </idol>
</idols>
```

---

### 공통점

- 데이터를 저장하고 전달하기 위해 고안
- 기계뿐만 아니라 사람도 쉽게 읽을 수 있음
- 계층적인 데이터 구조
- 다양한 프로그래밍 언어에 의해 파싱될 수 있음
- `XMLHttpRequest` 객체를 이용하여 서버로부터 데이터를 전송받을 수 있음

### 차이점

- 데이터를 표현하는 방식이 다르다
- JSON은 타입을 가지고 있지만, XML은 그렇지 않음
- JSON은 네임 스페이스를 지원하지 않음
- XML은 네임 스페이스를 지원함
- JSON은 보안에 취약한 편이다
- JSON은 UTF-8 인코딩만 지원하지만, XML은 여러 인코딩을 지원
