## Lazy Loading이란?

- 연관된 엔티티를 즉시 로딩하지 않고 **실제 사용할 때** 로딩하는 방식
- JPA에서 `@OneToOne`, `@ManyToOne` 관계는 기본적으로 **Lazy Loading**이 권장됨

```java
@Entity
public class User {
    @OneToOne(fetch = FetchType.LAZY)
    // profile이 실제로 필요한 순간에만 DB에서 조회
    private Profile profile;
}
```

---

## @OneToOne 양방향 연관관계에서 Lazy Loading 주의점

- **연관관계의 주인이 아닌 엔티티에서는 Lazy Loading이 제대로 동작하지 않을 수 있음**

### ❓왜지 …

- 연관관계의 주인이 아닌 엔티티는 **외래 키(FK)를 알 수 없음**
- 그래서 JPA는 해당 엔티티가 **null인지, 프록시를 넣을지** 판단할 수 없어 **추가 쿼리를 실행하거나 Lazy가 깨짐**

### 예시

```java
@Entity
public class User {
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profile_id") // FK를 User가 가짐 → 연관관계의 주인
    private Profile profile;
}

@Entity
public class Profile {
    @OneToOne(mappedBy = "profile", fetch = FetchType.LAZY) // 주인이 아님
    private User user;
}
```

- 이 구조에서 `Profile`에서 `user.getProfile()`을 호출하면 Lazy Loading이 **동작하지 않을 수 있음** (추가 쿼리 발생)

---

## 해결 방법

- **단방향 연관관계로 설계하기**
    - 주인이 아닌 엔티티에서는 **아예 관계를 제거**하거나 단방향으로 설계하면 문제 없음
- **정말 Lazy가 필요한지 검토**
    - 성능을 고려해서 꼭 Lazy가 필요한지 판단 → 불필요하면 `EAGER`나 `@Query` 사용

---

## 마지막 정리

- 외래 키를 가진 쪽(주인)은 **연락처를 알고 있어서** 필요할 때 연락(Lazy Loading)할 수 있음
- 반대쪽은 **연락처가 없기 때문에** 연락하려면 **누가 있는지 직접 찾아야 함** (추가 쿼리 발생)
