-- �̰� �ڸ�Ʈ �ۼ�
-- DAY2 ��������
/*���� �ٿ� ���� �ڸ�Ʈ �ۼ��� ��*/

/*
NUMBER : ���� + �Ǽ�
���ڿ� ���ڿ� ���� X
->JAVA������ STRING���� ó��
NUMBER(7,2) : �⺻��
CHAR() : ��ȣ �ȿ� �� ���� ǥ���ؾ���!, �������̷� ���� �κ��� ����ó��
NUMBER�� ���� ����
�ѱ��� �� ���ڿ� 2����Ʈ
VARCHAR2() : ��ȣ �ȿ� �� ���� ǥ���ؾ���!, �������̶� ���� �κ� ����ó�� ���� �ʴ´�.
DATE : ��¥�� ���ڷ� ó�� �Ǳ� ������ �� �� ��� ����
*/

/*
����Ŭ �ڷ���
- NUMBER(����, �Ǽ�), VARCHAR2(�������� ���ڿ�), 
    CHAR(�������� ���ڿ�), DATE(��¥, �ð�), LONG(�������� ���ڿ��̰� 2�Ⱑ���� ó�� ����)
    
- NUMBER : �⺻�� ��������, �⺻ �ڸ��� : 7
    NUMBER(�ڸ���) => NUMBER(12) : ������ �ִ� 12�ڸ����� ���
    NUMBER(�ִ����ڸ���, �Ҽ����Ʒ� �ڸ���) : �Ǽ��� �� ���
    => NUMBER(10, 2) : �Ǽ��� ���� �ִ� 10�ڸ����� ���
                                �Ҽ��� �Ʒ� �ڸ����� 2�ڸ����� ��� ����
                                
- CHAR(�����ڸ���) : ������ ���� ����Ʈ �����ŭ�� ���ڸ� ���
    CHAR(10) : ������ 10����Ʈ �����. ����, ������ ����Ʈ�� ���鹮�ڷ� ä��.
    
- VARCHAR2(�ִ��ϱ��ڹ���Ʈ��) : ������ ����Ʈ������ ������ ���ڸ� �����
    VARCHAR2(15) : �ִ� 15����Ʈ �̳��� ���ڷ� ���
    
- DATE : ��¥�� �ð� ó����
    ����, ��, ��, ��, ��, ��, ��, ����/����, ���� ó��
    �ѱ����� ���� ������ YY/MM/DD
    ������ ���� ������ DD/MM/YY


    

    



*/

--��¥ ���� Ȯ��
SELECT SYSDATE
FROM DUAL;

--����Ŭ �����ͺ��̽� ȯ�漳�� ���� �� Ȯ��
SELECT *
FROM V$NLS_PARAMETERS;

--�ѱ� ����Ʈ ũ�� Ȯ���ϱ�
SELECT LENGTH('���� Ŭ'), LENGTHB('����Ŭ'), LENGTHB('��')
FROM DUAL;

--��¥ ������ ��� ������
SELECT SYSDATE + 100 FROM DUAL; --���ú��� 100�� �ڿ� ��¥
SELECT SYSDATE - 300 FROM DUAL; --���� ��¥���� 300�� ��

SELECT SYSDATE - HIRE_DATE --���� -�Ի��� : ��¥��(�ٹ��ϼ�)
FROM EMPLOYEE;

SELECT SYSDATE + 120 / 24 FROM DUAL; --���� ��¥���� 120�ð� �ڿ� ��¥ ��ȸ

-- SELECT �� ***********************************************
-- DQL(Data Query Language)
-- �����ͺ��̽����� ���̺��� ���·� ��ϵ� �����͸� ��ȸ�� �� ����ϴ� ������

-- ��� 1
-- ���� ���̺�(EMPLOYEE)���� ���(EMP_ID), �����(EMP_NAME), ��ȭ��ȣ(PHONE) �÷��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE;

-- ��� 2
-- ���� ���̺��� ������ ����� 100��(������ �Ѽ���) ���� ��ȸ
SELECT * 
FROM EMPLOYEE
WHERE MGR_ID = '100';

-- ��� 3
-- ���� ���̺��� �Ѽ��� ����(����� 100)�� ������ �ް� �ִ� ���� ��ȸ
-- ���, �̸�, ��ȭ��ȣ, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, DEPT_ID
FROM EMPLOYEE
WHERE MGR_ID = '100';

-- ��� 4
-- ���� ���̺�� �μ� ���̺�(DEPARTMENT)���� ���� ��ȸ
-- ���, �̸�, �޿�, �μ���
Select Emp_Id, Emp_Name, Salary, Dept_Name
From  Employee
Join    Department Using (Dept_Id)
WHERE DEPT_ID = '50'
ORDER BY EMP_NAME ASC; --ASC�� ����

-- SELECT ���� ���� ***********************************
/*
SELECT * �� [DISTINCT] ��ȸ�� �÷��� �� ���� [AS] ��Ī(Alias)
FROM ��ȸ�� ����� ���̺��;

*/

-- * : ��� �÷� (���̺��� ���� �÷� ���� ��)
SELECT * 
FROM EMPLOYEE;

-- EMPLOYEE���̺��� ���, �����, �޿� ������ ��ȸ�� ���
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- DISTINCT �÷� ��
SELECT JOB_ID
FROM EMPLOYEE;

SELECT DISTINCT JOB_ID
FROM EMPLOYEE;
-- DISTINCT�� SELECT ���� �� 1���� ��� ����

SELECT DISTINCT JOB_ID, DISTINCT DEPT_ID
FROM EMPLOYEE; --ERROR

SELECT DISTINCT JOB_ID, DEPT_ID
FROM EMPLOYEE; --�� ������ �ϳ��� ��� �ߺ����� �ƴ����� üũ��

-- SLECT ���� ������ ����� ���� ����
SELECT (23 + 31) / 5
FROM DUAL; -- DUAL : DUMMY(��¥) ���̺�

-- ���� ���̺��� ���, �����, �޿�, 1��ġ �޿�
SELECT EMP_ID, EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- ���� ���̺��� ���, �����, �޿�, ���ʽ�����Ʈ, ���ʽ�����Ʈ�� ����� ���� ��ȸ
-- ���� : �޿� + (�޿� * ���ʽ� ����Ʈ)  * 12
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT, (SALARY + (SALARY * BONUS_PCT)) * 12
FROM EMPLOYEE;
-- ��갪�� NULL�� ������, ����� NULL�� ��.

-- ���Ŀ� �Լ� ����� �� ����
-- �÷��� ���� NULL�� ��쿡 �ٸ� ������ �ٲٴ� �Լ� : NVL
-- NVL(�÷���, �ٲܰ�) : 
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT,
            (SALARY + (SALARY * NVL(BONUS_PCT , 0))) * 12
FROM EMPLOYEE;

-- SELECT ���� ������ �÷��� �Ǵ� ���� �ڿ� ��Ī(Alias) ����� ���� ���� -> ������ ����
-- ��Ī�� �ݵ�� "��Ī"(ū����ǥ)�� ����� �ϴ� ��� : ��Ī�� �����̳� ����, ��ȣ����
SELECT EMP_ID ���, EMP_NAME �̸�, SALARY AS "�޿�(��)", -- AS�� �� �ᵵ ��
            SALARY * 12 AS "1�� �޿�", BONUS_PCT "���ʽ� ����Ʈ",
            BONUS_PCT, (SALARY + (SALARY * BONUS_PCT)) * 12 "���ʽ�����Ʈ���뿬��"
            
FROM EMPLOYEE;

-- SELECT ���� ���ͷ�(LITERAL : ��)�� ����� ���� ����
SELECT EMP_ID ���, EMP_NAME �̸�, '����' ���� -- ������ �� ����
FROM EMPLOYEE;


-- WHERE : ������
-- 1. FROM��(TABLE ã�´�) 2. WHERE��(��ġ�ϴ� ������ ���� ���)
/*
WHERE �� ���

3. SELECT  �÷��� ��Ī,     ........
1. FROM ���̺��
2. WHERE �÷��� �񱳿����� �񱳰�

- WHERE�� �ݵ�� FROM �� ������ ����ؾ� ��
- ���̺��� ���ǰ� ��ġ�ϴ� ���� ���� ����� ���
- >, <, >=, <=, =,
!=, <>, ^=(��ġ���� �ʴ� ���� ����)
- AND, OR, NOT
*/

-- �μ��ڵ尡 90�� �����鸸 ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90';

-- �����ڵ尡 'J7'�� �����鸸 ��ȸ
SELECT *
FROM EMPLOYEE
WHERE JOB_ID = 'J7';

-- �޿��� 400���� �ʰ��ϴ� �����鸸 ��ȸ
SELECT *
FROM EMPLOYEE
WHERE SALARY > 4000000;

-- �޿��� 2�鸸�̻� 4�鸸������ �����鸸 ��ȸ
SELECT EMP_ID ��� , EMP_NAME �̸�, SALARY �޿�, JOB_ID �����ڵ�, DEPT_ID �μ��ڵ�
FROM EMPLOYEE
-- WHERE SALARY >= 2000000 AND SALARY <= 4000000;
WHERE SALARY BETWEEN 2000000 AND 4000000; 

-- ��¥ �����Ϳ��� �÷��� BETWEEN ������ AND ū�� ������ �� ����
-- �Ի����� 1995�� 1�� 1�Ϻ��� 2000�� 12�� 31�� ���̿� �Ի���
-- ������ ���, �̸�, �Ի���, �μ��ڵ� ��ȸ, ��Ī ó��
-- ��¥������ ǥ�� �ÿ��� ����Ʈ���̽��� ���� ��¥ ���˿� ���缭
-- '��¥����' ��� ǥ���ؾ� ��
SELECT SYSDATE FROM DUAL; --'18/12/31' ǥ���ϸ� ��

SELECT EMP_ID ���, EMP_NAME �̸�, HIRE_DATE �Ի���, DEPT_ID �μ��ڵ�
FROM EMPLOYEE
-- WHERE HIRE_DATE >= '95/01/01' AND HIRE_DATE <=  '00/12/31';
WHERE HIRE_DATE BETWEEN '95/01/01' AND '00/12/31';

-- �μ��ڵ� '90'�̸鼭, �޿��� 2�鸸�� �ʰ��ϴ� ���� ��ȸ
-- 90�� �μ��� �Ҽӵ� ���� �߿��� �޿��� 2�鸸�� �Ѵ� ����
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90' AND SALARY >= 200000;

-- �μ��ڵ尡 90 �Ǵ� 20�� ���� ��ȸ
SELECT *
FROM EMPLOYEE
--WHERE DEPT_ID = '90' OR DEPT_ID =  '20';
WHERE DEPT_ID IN ('20', '90');

-- ���� ������ : || (�ڹ��� ���ڿ� ��ġ�� �ϴ� +�� ���� �ǹ��� ��������)
-- SELECT ������ ��ȸ�� �÷������� �ϳ��� ��ġ�ų�, �÷����� ���ͷ��� ��ĥ ���
SELECT EMP_NAME ||  ' ������ �޿��� ' || SALARY || ' �Դϴ�.' AS �޿�����
FROM EMPLOYEE
WHERE DEPT_ID = '90'

-- 2000�� 1�� 1�� ���Ŀ� �Ի��� ���� �߿���
-- ��ȥ�� ������ �̸�, �Ի���, �����ڵ�, �μ��ڵ�, �޿�, ��ȥ���� ��ȸ, ��Ī ó��
-- �޿��� �ڿ��� '(��)' ���ͷ� �ٿ���
-- ��ȥ���δ� ���ͷ��� ä��
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���, JOB_ID �����ڵ�, DEPT_ID �μ��ڵ�, SALARY  || '(��)' �޿� , '��ȥ' ��ȥ����
FROM EMPLOYEE
WHERE HIRE_DATE >= '00/01/01' AND MARRIAGE = 'Y';

-- �޿��� 2�鸸���� ���� �ްų�, 4�鸸���� ���� �޴� ���� ��ȸ
-- �̸�, �޿� ��ȸ
SELECT *
FROM EMPLOYEE
--WHERE SALARY < 2000000 OR SALARY > 4000000;
--WHERE NOT (SALARY >= 2000000 AND SALARY <= 4000000);
--WHERE SALARY NOT BETWEEN 2000000 AND 4000000;
WHERE NOT SALARY  BETWEEN 2000000 AND 4000000;



