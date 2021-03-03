
-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


-- SELECT �⺻
SELECT 
    A.certi_cd, A.certi_nm, A.issue_insti_nm
FROM tb_certi A;

-- DISTINCT : �ߺ� ������ ����
SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

-- ��Ī(ALIAS) ����
SELECT 
    A.certi_cd AS �ڰ����ڵ�, 
    A.certi_nm AS �ڰ����̸�, 
    A.issue_insti_nm AS �߱ޱ����
FROM tb_certi A;

-- �ռ� �����ڸ� �̿��� ������ ���� ����
SELECT 
    certi_nm || '(' || certi_cd || ')' || '-' || issue_insti_nm AS �ڰ�������
FROM tb_certi;

-- DUAL���̺��� �̿��� ����
SELECT
    ( (1+1)*3 ) / 6 AS ������
FROM DUAL;

-- BETWEEN, IN, LIKE
SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE dept_cd IN ('100004', '100006')
;

SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN ('100003', '100004', '100006') 
    AND birth_de BETWEEN '19900101' AND '19991231'
;

SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��__'
;

SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr,
    NVL(direct_manager_emp_no, '������') AS ���ӻ���ڵ�
FROM tb_emp
WHERE direct_manager_emp_no IS NULL -- NULL�� = ���� �� �Ұ�
;

-- �������� AND, OR, NOT
SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN ('100004', '100006')
    AND NOT ( addr LIKE '%������%' OR addr LIKE '%������%' )
;

-- ���� �񱳿�����
SELECT
    sal_his_no,
    pay_de,
    pay_amt,
    emp_no
FROM tb_sal_his
WHERE pay_de >= '20200501'
    AND pay_de <= '20200531'
    AND NOT pay_amt >= 5500000
;

SELECT
    emp_no,
    emp_nm,
    sex_cd,
    birth_de,
    dept_cd,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN ('100004', '100006')
    AND sex_cd <> '1'
;
