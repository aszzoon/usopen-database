-- index가 뭘까
use playground;
create database playground;

-- 높은 재귀(반복) 횟수를 허용하도록 설정
SET SESSION max_recursive_iterations = 1000000;

-- 더미 데이터 삽입 쿼리
INSERT INTO users (name, age)
WITH RECURSIVE cte (n) AS
                   (SELECT 1
                    UNION ALL
                    SELECT n + 1
                    FROM cte
                    WHERE n < 1000000 -- 생성하고 싶은 더미 데이터의 개수
                   )
SELECT CONCAT('User', LPAD(n, 7, '0')), -- 'User' 다음에 7자리 숫자로 구성된 이름 생성
       FLOOR(1 + RAND() * 1000) AS age  -- 1부터 1000 사이의 랜덤 값으로 나이 생성
FROM cte;

-- 잘 생성됐는 지 확인
SELECT COUNT(*)
FROM users;

select * from users
where age = 23;
