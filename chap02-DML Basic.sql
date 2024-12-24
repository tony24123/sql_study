CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    created_at DATE
);

--데이터 생성 : INSERT
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (1, '선풍기', 120000,SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (2, '세탁기', 2000000,SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name,  created_at)
VALUES
    (3, '달고나', SYSDATE);
    
-- NOT NULL 제약조건으로 인해 생성 불가능
INSERT INTO GOODS
    (id, price, created_at)
VALUES
    (4, 2000000,SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name)
VALUES
    (5, '계란');
    
--순서 상관 없음        
INSERT INTO GOODS
    (goods_name, id, created_at)
VALUES
    ('달고나', 6 , SYSDATE);

-- VALUES 앞에 컬럼명을 생략하면
-- 테이블 생성시 정해진 컬럼순서대로
-- 값을 모조리 넣어야함
INSERT INTO GOODS
VALUES
    (7, '탕수육', 30000 ,SYSDATE);
    
    
-- 데이터 수정 : UPDATE
UPDATE GOODS     
SET goods_name = '에어컨'
WHERE id = 1;

--동시 수정
UPDATE GOODS
SET 
goods_name = '짜장면'
, price = 8000
WHERE id = 3;

COMMIT;

--WHERE 조건절이 없는 UPDATE
--모든 데이터 수정 , 주의 필요 
UPDATE GOODS
SET price = 9999;

-- ID는 웬만하면 바꾸지 말기
UPDATE GOODS 
SET id = 11
WHERE id = 2;

UPDATE GOODS 
SET price = null
WHERE id = 6;

--데이터 삭제 : DELETE
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

--WHERE절이 없는 DELETE는 전체삭제 효과를 지닌다.
--그러나 이것은 복구가 가능, TRUNCATE TABLE은 복구 불가능
DELETE FROM GOODS;
ROLLBACK;



--데이터 조회 : SELECT
SELECT * FROM GOODS;

SELECT
    certi_cd
    , certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

SELECT
    certi_nm    
    , issue_insti_nm
FROM TB_CERTI
;

-- DISTINCT : 중복 제거
SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI
;

-- 모든 컬럼 조회
SELECT 
    *
FROM TB_CERTI
;


-- 컬럼 별칭 지정 (ALIAS)
-- AS는 생략 가능
-- ""도 경우에 따라서 생략가능 (별칭에 띄어쓰기가 있으면 불가능)
SELECT
    emp_nm "사원명"
    ,addr AS 주소
FROM TB_EMP
;

-- 문자열 결합 ( || or표시)
SELECT
    '자격증 정보: ' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;