-- DAY 5

SELECT EMP_NAME, SALARY, DEPT_ID
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL
ORDER BY SALARY DESC, 1 DESC; -- ù��° �÷��� EMP_NAME�� ���� ORDER BY�� �ȴ�

-- 2003�� 1�� 1�� ���Ŀ� �Ի��� �������� ��ȸ
-- �̸�, �Ի���, �μ��ڵ�, �޿� ��ȸ, ��Ī ó��
-- �μ��ڵ带 ���� �������� �����ϰ�, ���� �μ��ڵ��� ���� �Ի��� ���� �������� ����
-- �Ի��ϵ� ������ �̸� ���� �������� ����
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���, DEPT_ID �μ��ڵ�, SALARY �޿�
FROM EMPLOYEE
WHERE HIRE_DATE > TO_DATE('20030101', 'RRRRMMDD')
--ORDER BY DEPT_ID DESC NULLS LAST, HIRE_DATE, EMP_NAME;
--ORDER BY 3 DESC NULLS LAST, 2, 1;
ORDER BY �μ��ڵ� DESC NULLS LAST, �Ի���, �̸�;

-- GROUP BY ��*******************************
-- ���� ������ ���� �� ��ϵ� Ŀ���� �������� ���� ������ �׷� ���� �� �����
-- GROUP BY �÷��� | ����
-- ���� �׸� ���� ��� ����� �� �����
-- �׷� ���� �׸� ���� ����� SELECT ���� �׷� �Լ��� ��õ�
SELECT EMP_NAME, SALARY, DEPT_ID
FROM EMPLOYEE;

-- �μ��� �޿��� �հ踦 ����
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
ORDER BY DEPT_ID ASC NULLS LAST;

-- ���޺� �޿��� �հ�, �޿��� ���(������ ó��), ������ ��ȸ
SELECT JOB_ID, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_ID 
ORDER BY JOB_ID NULLS LAST;

-- GROUP BY ���� ������� �ʴ� �÷��� SELECT ���� ��� �� �Ѵ�!!!!!!!
-- SELECT ���� �׷��Լ��� ���� ����� �÷��� �ݵ�� GROUPD BY ���� ���Ǿ�� ��
-- �μ���, ���޺� �޿��հ�, ���, ������ ��ȸ
SELECT DEPT_ID, JOB_ID, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_ID; --ERROR

SELECT DEPT_ID, JOB_ID, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_ID, JOB_ID
ORDER BY DEPT_ID NULLS LAST, JOB_ID NULLS LAST;

-- ���� ���
-- ������ �޿��հ�, �޿����(õ�������� �ݿø���), ������ ��ȸ
SELECT DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '3', '��', '��') ����,
            SUM(SALARY) �޿��հ�, ROUND(AVG(SALARY), -4), COUNT(*)
FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '3', '��', '��');

-- ERROR : ������� ������ �޶� ������
SELECT DEPT_ID, COUNT(*)
FROM EMPLOYEE;

-- �ذ�
SELECT DEPT_ID, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- �μ��� �޿��հ� �� ���� ū �� ��ȸ
SELECT MAX(SUM(SALARY)) - 18100000
FROM EMPLOYEE
GROUP BY DEPT_ID;

SELECT DEPT_ID, MAX(SUM(SALARY)) 
FROM EMPLOYEE
GROUP BY DEPT_ID; --ERROR : ROW ������ �ٸ� DEPT_ ID�� 7���ε� MAX ���� ���� 1����

-- HAVING �� ****************
-- GROUP BY �� �Ʒ��� �����
-- �ݵ�� GROUPD BY ���� �Բ� ����ؾ� ��
-- �׷� ��� ����� �׷��Լ� ������鿡 ���� ���� ó���� ����

-- HAVING �׷��Լ�(�÷���) �񱳿����� �񱳰�
-- SELECT ���� HAVING ó���� ��� ����� ��� ó����

-- �μ��� �޿��հ� �� 9�鸸���� �ʰ��ϴ� �μ��� �޿��հ� ��ȸ
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID
HAVING SUM(SALARY) > 9000000;

-- �м��Լ� *********************************************
-- RANK() �Լ� : ����(���) ��ȸ�� ���

-- �ش� ���� ���� ��ü �������� ������ �˰��� �� ��
-- RANK(������ �˰��� �ϴ� ��) WITHIN GROUP (ORDER BY �÷��� ���Ĺ��)
SELECT RANK(2300000) WITHIN GROUP (ORDER BY SALARY DESC)
FROM EMPLOYEE;

-- ��ü ���� ������ �ű���� �� ���
SELECT EMP_NAME, SALARY,
            RANK() OVER (ORDER BY SALARY DESC) ����
FROM EMPLOYEE
ORDER BY ����;

SELECT EMP_NAME, SALARY,
            RANK() OVER (ORDER BY EMP_NAME DESC) ����
FROM EMPLOYEE
ORDER BY ����;

-- ROULLUP
-- GROUP BY �������� �����
-- �׷캰�� ��� ����� ����� ���ؼ� �����踦 ���� �� �����
SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_ID); -- ���հ踦 ���ؼ� �� �Ʒ��� �߰���

SELECT DEPT_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- �Լ��� ���� ���� ���°� �ٲ�!!!!!!
-- �׷��Լ��� ���� ������鿡 ���� �����谡 �ڵ����� �Ʒ��ʿ� ������ �߰���
SELECT DEPT_ID, SUM(SALARY), AVG(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL
GROUP BY ROLLUP(DEPT_ID);

-- �ǽ� : �μ��ڵ�� �����ڵ带 �Բ� �׷����� ���� �޿��� �հ踦 ����
-- ROLLUP ���
SELECT DEPT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID, JOB_ID;

SELECT DEPT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL AND JOB_ID IS NOT NULL
GROUP BY ROLLUP(DEPT_ID, JOB_ID);

SELECT DEPT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL AND JOB_ID IS NOT NULL
GROUP BY ROLLUP(DEPT_ID), ROLLUP(JOB_ID);

SELECT DEPT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL AND JOB_ID IS NOT NULL
GROUP BY ROLLUP(JOB_ID), ROLLUP(DEPT_ID);

-- CUBE : ���谡 ���� ����
SELECT DEPT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL AND JOB_ID IS NOT NULL
GROUP BY CUBE(DEPT_ID, JOB_ID);

-- GROUPING *************************
-- SELECT ���� GROUP BY �������� �����
-- �÷� �׷� ���� �� �����
-- �׷� ���� ��(0)����, ���谪(1)���� �����ϱ� ���� �뵵�� �����
-- ROLLUP, CUBE �Լ� ���� �̿��ϴ� �Լ���
SELECT DEPT_ID, JOB_ID, SUM(SALARY),
            GROUPING(DEPT_ID) "�μ��� �׷� ���� ����",
            GROUPING(JOB_ID) "���޺� ���� ����"
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL AND JOB_ID IS NOT NULL
GROUP BY ROLLUP(DEPT_ID, JOB_ID);

SELECT DEPT_ID, JOB_ID, SUM(SALARY),
            GROUPING(DEPT_ID) "�μ��� �׷� ���� ����",
            GROUPING(JOB_ID) "���޺� ���� ����"
FROM EMPLOYEE
WHERE DEPT_ID IS NOT NULL AND JOB_ID IS NOT NULL
GROUP BY CUBE(DEPT_ID, JOB_ID);

-- GROUPING SETS**********
-- �׷캰�� ��� ó���� ���� ���� SELECT ���� �ϳ��� ��ģ ����� ���� �� ���
-- ���ѿ�����(SET OPERATOR) ����� ���
SELECT DEPT_ID, JOB_ID, MGR_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID, JOB_ID, MGR_ID
UNION ALL
SELECT DEPT_ID, NULL, MGR_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID, MGR_ID
UNION ALL
SELECT NULL, JOB_ID, MGR_ID, AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_ID, MGR_ID;

-- ���� ó�������� GROUPING SETS�� �ٲٸ�
SELECT DEPT_ID, JOB_ID, MGR_ID, AVG(SALARY) 
FROM EMPLOYEE
GROUP BY GROUPING SETS((DEPT_ID, JOB_ID, MGR_ID), 
                                        (DEPT_ID, MGR_ID), 
                                        (JOB_ID, MGR_ID));

SELECT DEPT_ID, JOB_ID, MGR_ID, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_ID, (JOB_ID, MGR_ID));

-- ROWID : �� ���� �����ϴ� �࿡ ���� ���̵�
-- �����ͺ��̽��� �ڵ����� ����, ��������, ��ȸ�� �� �� ����
SELECT EMP_ID, ROWID
FROM EMPLOYEE;
