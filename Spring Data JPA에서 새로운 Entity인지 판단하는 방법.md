# 이게 무슨 말인가?

- 엔티티가 새로 만들어진 객체인지, 아니면 이미 데이터베이스에 저장되어 있는 객체인지 판단하는 기준을 물어 보는 것 입니다!

# 그러니 식별하는 기준을 알아보자!

1. 식별자(ID) 값을 확인한다

   - ID가 `null` 일 경우 : 아직 DB에 저장되지 않은 새로운 객체
   - ID가 `null` 이 아닐 경우 : 기존 DB에 저장되어 있는 객체

2. ```
   EntityManager
   ```

   를 이용하여 확인한다

   - `true` 를 반환한다 : 영속성 컨텍스트에서 관리 중인 엔티티이다
   - `false` 를 반환한다 : 영속성 컨텍스트에서 관리되지 않는 엔티티이다

3. ```
   save()
   ```

    메서드를 활용한다

   - `save()` 메서드는 이미 있는 객체라면 `update`  새로운 객체라면 `insert` 를 자동으로 처리한다

# 예시코드

```java
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

}

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void saveOrUpdate(User user) {
        if (user.getId() == null) {
            // 새로 생성된 엔티티
            userRepository.save(user); // insert
        } else {
            // 이미 데이터베이스에 저장된 엔티티
            userRepository.save(user); // update
        }
    }
}
```