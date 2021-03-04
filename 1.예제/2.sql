

-- ���ڿ� ��
CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_compare_4 CHAR(4),
    char_compare_6 CHAR(6)
);

INSERT INTO char_compare     
VALUES ('10001', 'SQLD', 'SQLD');

INSERT INTO char_compare     
VALUES ('10002', 'SQLD', 'SQLA');

COMMIT;

SELECT * FROM char_compare;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(char_compare_6, ' ', '+') AS char_compare_6
FROM char_compare;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(char_compare_6, ' ', '+') AS char_compare_6
FROM char_compare
WHERE sn = '10001' 
    AND char_compare_4 = char_compare_6
;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(char_compare_6, ' ', '+') AS char_compare_6
FROM char_compare
WHERE sn = '10002' 
    AND char_compare_4 > char_compare_6
;



CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_compare_4 CHAR(4),
    varchar_compare_6 VARCHAR2(6)
);

INSERT INTO varchar_compare     
VALUES ('10001', 'SQLD', 'SQLD  ');

INSERT INTO varchar_compare     
VALUES ('10002', 'SQLD', 'SQLA  ');

COMMIT;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(varchar_compare_6, ' ', '+') AS varchar_compare_6
FROM varchar_compare;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(varchar_compare_6, ' ', '+') AS varchar_compare_6
FROM varchar_compare
WHERE char_compare_4 = varchar_compare_6
;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(varchar_compare_6, ' ', '+') AS varchar_compare_6
FROM varchar_compare
WHERE char_compare_4 = TRIM(varchar_compare_6)
;

-- ������� ��
SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(varchar_compare_6, ' ', '+') AS varchar_compare_6
FROM varchar_compare
WHERE sn = '10001'
    AND char_compare_4 = 'SQLD    '
;

SELECT 
    REPLACE(char_compare_4, ' ', '+') AS char_compare_4,
    REPLACE(varchar_compare_6, ' ', '+') AS varchar_compare_6
FROM varchar_compare
WHERE sn = '10001'
    AND varchar_compare_6 = 'SQLD'
;

-- # ������ �Լ�
-- ## ���ڿ� �Լ�

SELECT 
    LOWER('SQL Developer') AS "LOWER('SQL Developer')", -- ���� �ҹ��ڷ� ��ȯ
    UPPER('SQL Developer') AS "UPPER('SQL Developer')", -- ���� �빮�ڷ� ��ȯ   
    ASCII('A') AS "ASCII('A')", -- ���ڸ� �ƽ�Ű�ڵ�� ��ȯ
    CHR('65') AS "CHR('65')",   -- �ƽ�Ű�ڵ带 ���ڷ� ��ȯ
    CONCAT('SQL', 'Developer') AS "CONCAT('SQL', 'Developer')", -- ���ڿ��� ����
    SUBSTR('SQL Developer', 1, 3) AS "SUBSTR('SQL Developer', 1, 3)", -- ��ġ���� ������ŭ �ڸ�(��ġ�� 1���ͽ���)
    LENGTH('SQL') AS "LENGTH('SQL')", -- ���ڿ��� ���̸� ��ȯ
    LTRIM('  SQL') AS "LTRIM('  SQL')", -- ���� ������ ����
    RTRIM('SQL  ') AS "RTRIM('SQL  ')",  -- ������ ������ ����
    RPAD('Steve', 10, '-') AS "RPAD('Steve', 10, '-')", -- �����ʿ� �־��� ���ڸ� ä��
    LPAD('Steve', 10, '*') AS "LPAD('Steve', 10, '-')", -- ���ʿ� �־��� ���ڸ� ä��
    REPLACE('Java Programmer', 'Java', 'BigData') AS "REPLACE" -- ���ڸ� ��ü��
FROM dual;
    
    
-- ## ������ �Լ�
SELECT 
    MOD(27, 5) AS MOD, -- ������ �� ��ȯ
    CEIL(38.678) AS ceil, -- �ø��� ��ȯ
    FLOOR(38.678) AS floor, -- ������ ��ȯ
    ROUND(38.678, 2) AS round, -- �ڸ������� �ݿø�
    TRUNC(38.678, 2) AS trunc  -- �ڸ��� ���ϸ� ����
FROM dual;

-- ## ��¥�� �Լ�

-- ���� ��¥�� ��ȸ
SELECT SYSDATE 
FROM dual;

-- ���� ��¥�� �ð� ��ȸ
SELECT SYSTIMESTAMP
FROM dual;

SELECT * FROM tb_emp;

-- ��¥ ����
-- ��¥ + ���� = ��¥  => ��(DAY) ���� ��¥�� ����
-- ��¥ - ���� = ��¥  => ��¥���� �� ���� ��
-- ��¥ - ��¥ = �ϼ�  => � ��¥���� �ٸ� ��¥�� �� �ϼ�
-- ��¥ + ����/24 = ��¥  => ��¥�� �ð��� ����

SELECT 
    SYSDATE AS "���� �ð�",
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",
    SYSDATE - (1/24) AS "1�ð� ����",
    SYSDATE - (1/24/60) * 100 AS "100�� ����",
    SYSDATE - (1/24/60/60) * 30 AS "30�� ����"
FROM dual;


-- ## ��ȯ �Լ�

-- ��¥�� ���ڷ� ��ȯ (TO_CHAR�Լ�)
-- ��¥�� ������������ : Y - ����, MM - ���ڸ� ��, D - �ϼ�, 
-- �ð��� ������������ : HH12 - (1-12), HH24 (0-24), MI - ��, SS - ��, AM PM - ���� ����
SELECT 
    TO_CHAR(SYSDATE, 'MM - DD') as "��¥(��,��)",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD') as "��¥(��,��,��)",
    TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') as "��¥-�ѱ�����",
    TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') as "��¥�� �ð�",
    TO_CHAR(SYSDATE, 'YY/MM/DD AM HH12:MI:SS') as "��¥�� �ð�2"
FROM dual;

-- ���ڸ� ���ڷ� ��ȯ
-- ���� ���� ����
-- $ : �޷���ȣ, L : ����ȭ���ȣ, . : �Ҽ���ǥ��, , : �޸�ǥ�� 
SELECT 
    TO_CHAR(9512 * 1.37, '$999,999.99') AS "�޷�",
    TO_CHAR(1350000, '999,999,999L') AS "��ȭ"
FROM dual;

-- # ���� ��ȯ �Լ� TO_NUMBER
SELECT 
    TO_NUMBER('$5,500', '$999,999') - 4000 AS "�����"
FROM dual;
