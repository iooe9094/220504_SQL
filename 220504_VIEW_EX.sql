-- [ ��(VIEW) �������� ]
-- ���� 1) 20�� �μ��� �Ҽӵ� ����� ��� ��ȣ�� �̸��� �μ� ��ȣ�� ����ϴ� VIEW�� �����ϱ�
CREATE OR REPLACE VIEW VW_EMP_TEST01
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO LIKE 20;

-- ���� 2) �̹� �����Ǿ� �ִ� ��� �信 ���� �޿� ���� ����ϵ��� �����ϱ�
CREATE OR REPLACE VIEW VW_EMP_TEST01
AS
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO LIKE 20;

ALTER TABLE EMPLOYEE RENAME COLUMN DEPTNO TO DNO;