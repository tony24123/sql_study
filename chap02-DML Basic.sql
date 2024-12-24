CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    created_at DATE
);

--������ ���� : INSERT
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (1, '��ǳ��', 120000,SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (2, '��Ź��', 2000000,SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name,  created_at)
VALUES
    (3, '�ް�', SYSDATE);
    
-- NOT NULL ������������ ���� ���� �Ұ���
INSERT INTO GOODS
    (id, price, created_at)
VALUES
    (4, 2000000,SYSDATE);
    
INSERT INTO GOODS
    (id, goods_name)
VALUES
    (5, '���');
    
--���� ��� ����        
INSERT INTO GOODS
    (goods_name, id, created_at)
VALUES
    ('�ް�', 6 , SYSDATE);

-- VALUES �տ� �÷����� �����ϸ�
-- ���̺� ������ ������ �÷��������
-- ���� ������ �־����
INSERT INTO GOODS
VALUES
    (7, '������', 30000 ,SYSDATE);
    
    
-- ������ ���� : UPDATE
UPDATE GOODS     
SET goods_name = '������'
WHERE id = 1;

--���� ����
UPDATE GOODS
SET 
goods_name = '¥���'
, price = 8000
WHERE id = 3;

COMMIT;

--WHERE �������� ���� UPDATE
--��� ������ ���� , ���� �ʿ� 
UPDATE GOODS
SET price = 9999;

-- ID�� �����ϸ� �ٲ��� ����
UPDATE GOODS 
SET id = 11
WHERE id = 2;

UPDATE GOODS 
SET price = null
WHERE id = 6;

--������ ���� : DELETE
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

--WHERE���� ���� DELETE�� ��ü���� ȿ���� ���Ѵ�.
--�׷��� �̰��� ������ ����, TRUNCATE TABLE�� ���� �Ұ���
DELETE FROM GOODS;
ROLLBACK;



--������ ��ȸ : SELECT
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

-- DISTINCT : �ߺ� ����
SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI
;

-- ��� �÷� ��ȸ
SELECT 
    *
FROM TB_CERTI
;


-- �÷� ��Ī ���� (ALIAS)
-- AS�� ���� ����
-- ""�� ��쿡 ���� �������� (��Ī�� ���Ⱑ ������ �Ұ���)
SELECT
    emp_nm "�����"
    ,addr AS �ּ�
FROM TB_EMP
;

-- ���ڿ� ���� ( || orǥ��)
SELECT
    '�ڰ��� ����: ' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;