-- ����) ROLLBACK / COMMIT
-- Ʈ�����(Transaction)����
-- ROLLBACK : DML(INSERT / UPDATE / DELETE) ���� ���
-- COMMIT : DML(INSERT / UPDATE / DELETE) ���� ���� �ݿ�
-- ��) Ʈ����� ����
--     INSETR ~
--     UPDATE ~
--     DELETE ~
--     COMMIT[ROLLBACK] : Ʈ����� ���� ( 1���� Ʈ����� )

-- ���� ����) AUTOCOMMIT : �ڵ� DB ���� �ݿ�
--          Oracle DB : AUTOCOMMIT = FALSE�� ������
--          MYSQL/MRIADB : AUTOCOMMIT = TRUE�� ������

-- ���� 9) ������ ������ ���̺� ����� ���� SQL ��ɾ�
SELECT * FROM USER_TABLES;
SELECT * FROM EMP_INSERT;
SELECT * FROM EMP_COPY;

-- �������� 1) EMP ���̺��� ������ �����Ͽ� EMP_INSERT�� �̸��� �� ���̺� �����
CREATE TABLE EMP_INSERT
AS
SELECT *
FROM EMP
WHERE 1=2; -- ���������� ����� ������ �ȵ����� ������ ������

-- �������� 2) ������ EMP_INSERT(�ӽ� �������̺�) ���̺� �߰��ϵ�,
-- SYSDATE�� �̿��Ͽ� �Ի����� ���÷� �Է��ϱ�

-- ���̺� ���� ���� ���
DESC EMP_INSERT;
-- �÷� ����� ���� ��ųʸ� �Ұ�
SELECT * FROM USER_TAB_COLUMNS
ORDER BY TABLE_NAME, COLUMN_ID;
-- ���̺� ������ �ֱ�
INSERT INTO EMP_INSERT(ENAME, HIREDATE)
VALUES('�Ϻ���', SYSDATE);

-- �������� 3) EMP_INSERT(�ӽ� �������̺�) ���̺� �� ����� �߰��ϵ�, TO_DATE �Լ��� �̿��Ͽ� �Ի����� ������ �Է��ϱ�
INSERT INTO EMP_INSERT(ENAME, HIREDATE)
VALUES('�ְ���', TO_DATE(SYSDATE-1, 'YY/MM/DD');

-- �������� 4) EMPLOYEE ���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ����
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP;
-- ���̺� Ȯ��
SELECT * FROM EMP_COPY;

-- ���� 10) DML(���������۾�) �ǽ�
-- �������� 1. �����ȣ�� 7788�� ����� �μ���ȣ�� 10������ �����ϱ�
UPDATE EMP_COPY
SET DEPTNO = 10
WHERE EMPNO = 7788;
SELECT * FROM EMP_COPY;

-- �������� 2. �����ȣ�� 7788�� ��� ���� �� �޿��� �����ȣ 7499�� ��� ���� �� �޿��� ��ü�ϱ�
UPDATE EMP_COPY
SET (JOB, SAL) = (SELECT JOB, SAL FROM EMP_COPY WHERE EMPNO = 7499)
WHERE EMPNO = 7788;

-- �������� 3. DEPARTMENT ���̺��� ������ ������ �����Ͽ� DEPT_COPY��� �̸��� ���̺��� �����ϱ�
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPT;

-- �������� 4. DEPT_COPY ���̺��� �μ����� RESEARCH�� �μ��� �����ϱ�
DELETE FROM DEPT_COPY
WHERE DNAME = 'RESEARCH';

-- �������� 5. DEPT_COPY ���̺��� �μ���ȣ�� 10�̰ų� 40�� �μ��� �����ϱ�
DELETE FROM DEPT_COPY
WHERE DEPTNO IN (10, 40);

COMMIT;

-- �������� 10) DEPT_COPY ���̺��� DNAME�� 'SALES'�̸� LOC�� 'SEOUL'�� �����ϰ�,
--             �ƴϸ� 'BUSAN' �̶�� ����
UPDATE DEPT_COPY
SET LOC = DECODE(DNAME, 'SALES', 'SEOUL'
                               , 'BUSAN');
COMMIT;