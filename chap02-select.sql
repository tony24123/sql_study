
-- WHERE ������ : �����͸� ���͸�
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd = 1
;

-- PK�� ���͸��ϸ� ������ 0�� �Ǵ� 1���� ��ȸ��
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE emp_no = 1000000003
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd != 1
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd <> 1 -- NOT EQUAL
;

-- 90�����鸸 ���͸�
SELECT 
    emp_no
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231'
;

-- ���� �����͸� ��ȸ : BETWEEN A AND B
SELECT 
    emp_no
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;


-- IN ������ : OR����
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd = 100002
        OR dept_cd = 100007
        OR dept_cd = 100009
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd IN (100002, 100007, 100009)
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd NOT IN (100002, 100007, 100009)
;

-- LIKE ����
-- Ư�� �ܾ ���Ե� �˻�
-- ���ϵ�ī�� ����(%: 0���� �̻�, _: �� 1����)
SELECT 
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE addr LIKE '%����%'
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '��%'
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '��__'
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '%��'
;

SELECT 
 email
FROM user
WHERE email LIKE '_a%@%.com' -- banana123@gmail.com
;

-- ������ �达�̸鼭
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� 
-- ���, �̸�, ����, �μ��ڵ带  ��ȸ
SELECT
    emp_no
    ,emp_nm
    ,birth_de
    ,dept_cd
FROM TB_EMP
WHERE 1=1 --�ǹ����� �ּ�ó�� ���ϰ� �ϱ����� ������ TRUE�� ������ ���� ����
    AND emp_nm LIKE '��%'
--    AND dept_cd IN (100003, 100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;


-- NULL�� ��ȸ
-- NULL��ȸ�� ������ IS NULL
SELECT 
    emp_no
    , emp_nm
    , direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS NULL --NULL��ȸ�� Ư���ϰ� '= NULL' �Ұ���
;

SELECT 
    emp_no
    , emp_nm
    , direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS NOT NULL --NULL��ȸ�� Ư���ϰ� '= NULL' �Ұ���
;

--������ �켱 ����
-- NOT > AND > OR
SELECT
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '��%'      --�达�̸鼭 �ϻ��� �� ��ȸ -> ���� ��¾� ��ȸ
    AND addr LIKE '%�ϻ�%'
        OR addr LIKE '%����%'
;

--������ �켱 ����
-- NOT > AND > OR
SELECT
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '��%'      
    AND (addr LIKE '%�ϻ�%'
        OR addr LIKE '%����%')
;
