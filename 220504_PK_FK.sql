-- 220504 �����͹��Ἲ(PK/FK) �ǽ�

-- ���� ����(CONSTRAINT)
-- ���̺��� �÷��� ��ȿ���� �ʴ� ���� �ɷ����� ���� �ɾ��ִ� ��

-- [ ���Ἲ ���� ���� ]

-- 1. NOT NULL ����
CREATE TABLE CUSTOMER(
      ID VARCHAR2(20) NOT NULL, -- NOT NULL �ɸ� NULL���� �������� ����
      PWD VARCHAR2(20) NOT NULL,
      NAME VARCHAR2(20) NOT NULL,
      PHONE VARCHAR2(30),
      ADDRESS VARCHAR2(100)
);

-- NOT NULL INSERT �׽�Ʈ
-- NOT NULL ���������� ���̺� ���� �� ����Ͽ����Ƿ�, ���� �� ������ �� ���ٴ� ���� �߻�
INSERT INTO CUSTOMER
VALUES (NULL, NULL, NULL, '010-1111-1111', 'BUSAN');

-- 2. UNIQUE ���� : ���̺��� �÷��� �����Ͱ� ������ ������ ���� �� �� �ְ� ��
CREATE TABLE CUSTOMER2(
      ID VARCHAR2(20) UNIQUE, 
      PWD VARCHAR2(20) NOT NULL,
      NAME VARCHAR2(20) NOT NULL,
      PHONE VARCHAR2(30),
      ADDRESS VARCHAR2(100)
);

-- NULL : UNIQUE ���� ���ǿ� ���ݵ��� ����
INSERT INTO CUSTOMER2
VALUES('1', '1111', 'ȫ�浿', '010-1111-1111', 'BUSAN');

-- ���� ID '1'�� �Ʒ��� ID '1'�� �ߺ��� ����
-- UNIQUE�� �� ID���� �ߺ��ǰ� �߰��ϸ� ���Ἲ ���� ���� ���� ���� �߻�
INSERT INTO CUSTOMER2
VALUES('1', '1111', '�̼���', '010-1111-1111', 'BUSAN');

-- �������ǿ� �̸��� ������ �� ����
CREATE TABLE CUSTOMER3(
      ID VARCHAR2(20) CONSTRAINT UK_ID UNIQUE, 
      PWD VARCHAR2(20) NOT NULL,
      NAME VARCHAR2(20) NOT NULL,
      PHONE VARCHAR2(30),
      ADDRESS VARCHAR2(100)
);

-- ��ųʸ� ��Ͽ��� ���� ���� Ȯ�� ����
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'CUSTOMER3';

-- 3. ***** PRIMARY KEY  ���� : �ſ��߿� *****
-- UNIQUE + NOT NULL ȿ�� : ������ �� + NOT NULL ���� + INDEX ����(�ڵ�)
CREATE TABLE CUSTOMER4(
      ID VARCHAR2(20), 
      PWD VARCHAR2(20) NOT NULL,
      NAME VARCHAR2(20) NOT NULL,
      PHONE VARCHAR2(30),
      ADDRESS VARCHAR2(100),
      CONSTRAINT PK_ID PRIMARY KEY(ID)
);

-- PK_ID�� PRIMARY KEY(ID)�� �ɷ� �ִ� �����̹Ƿ�,
-- ID�� 1�� �־��� ��, �� �� �߰��ϴ� ������ NULL�̳� 1�� ���� �߻�
INSERT INTO CUSTOMER4
VALUES(NULL, '1111', '�̼���', '010-1111-1111', 'BUSAN');

INSERT INTO CUSTOMER4
VALUES('1', '1111', '�̼���', '010-1111-1111', 'BUSAN');

-- 4. FOREIGN KEY ���� : �����Ǵ� ���̺� �÷� ���� �׻� �����ؾ� �� (�߿�)**
-- �θ����̺�(ID: 1, 2, 3) - �ڽ����̺�(ID: 1, 2, 3)
-- EX) �θ����̺� : �μ�(����, ���, �) - �ڽ����̺�(����, ���, �) : ���� => FK (���� ���Ἲ)
-- EX) �μ����̺� :
SELECT * FROM DEPT;

-- FK �׽�Ʈ ���̺�
CREATE TABLE EMP_SECOND (
       ENO NUMBER(4) CONSTRAINT PK_ENO PRIMARY KEY,
       ENAME VARCHAR2(10),
       JOB VARCHAR2(9),
       DNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPT
);

INSERT INTO EMP_SECOND(ENO, ENAME, DNO)
VALUES(8000, 'LEE', 40); --DEPT �÷��� DNO�� 50�� �����Ƿ� 50���� �߰��� �� ���� ���ǿ� ����, 40�� �����Ƿ� �߰� ����

-- 5. DEFAULT ���� ����
-- �÷��� �����Ͱ� �ƹ��� ���� �Էµ��� �ʾ��� �� ����Ʈ�� ������ ���� �Էµ�
CREATE TABLE EMP_THIRD (
       ENO NUMBER(4) CONSTRAINT PK_ENO2 PRIMARY KEY,
       ENAME VARCHAR2(10),
       SALARY NUMBER(7,2) DEFAULT 1000
);

-- DEFAULT �׽�Ʈ
INSERT INTO EMP_THIRD(ENO, ENAME)
VALUES(8000, 'ȫ�浿');

-- ������ �׽�Ʈ
SELECT * FROM EMP_THIRD;

-- ���̺� ����
SELECT TABLE_NAME FROM USER_TABLES;

-- ���� ����
-- EMP_COPY ����
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP;

-- DEPT_COPY ����
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPT;

-- ���̺� ���� �� ���� ���� �ɱ�
-- EMP_COPY PRIMARY KEY ����
ALTER TABLE EMP_COPY
ADD CONSTRAINT PK_EMP_COPY_ENO PRIMARY KEY(EMPNO); 

-- DEPT_COPY PRIMARY KEY ����
ALTER TABLE DEPT_COPY
ADD CONSTRAINT PK_EMP_COPY_ENO PRIMARY KEY(EMPNO);

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- FOREIGN KEY ����
ALTER TABLE EMP_COPY
ADD CONSTRAINT FK_EMP_COPY_DNO 
FOREIGN KEY(DEPTNO) REFERENCES DEPT_COPY(DEPTNO);

-- ���� ������ ������ �� �����ϱ�
-- ����) ���� �ڽ����̺��� FOREIGN KEY�� �����ϰ�
--         �θ����̺��� PRIMARY KEY�� �����ؾ��Ѵ�
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY; -- ����

-- ��ü ���� ��� ��� ( CASCADE )
-- PRIMARY KEY�� ���ÿ� �ڽ����̺��� FOREIGN KEY�� ã�Ƽ� ����
ALTER TABLE DEPT_COPY
DROP PRIMARY KEY CASCADE;

SELECT * FROM USER_CONSTRAINT
WHERE TABLE_NAME = 'EMP_COPY';

-- [ �������� �������� ]
-- ���� 1) EMP ���̺��� ������ �����Ͽ� EMP_SAMPLE ���̺� �����ϱ�
--           ��� ���̺��� ��� ��ȣ �÷��� ���̺� ������ PRIMARY KEY ���� ������ �����ϵ�,
--           ���� ���� �̸��� PK_MY_EMP
CREATE TABLE EMP_SAMPLE
AS
SELECT *
FROM EMP
WHERE 1=2;

-- �⺻ Ű(PRIMARY KEY) ����
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT PK_MY_EMP PRIMARY KEY(EMPNO);

-- �������� ���� ��ųʸ� SQL��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP_COPY';

-- �������ǿ� ���� ���̺�, �÷��� ���� SQL��
SELECT B.TABLE_NAME, A.COLUMN_NAME, B.CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS A,
         USER_CONSTRAINTS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
ORDER BY B.TABLE_NAME;

-- ���� 2) DEPT ���̺��� ������ �����Ͽ� DEPT_SAMPLE ���̺� �����ϱ�
--           �μ���ȣ �÷�(DNO)�� PRIMARY KEY ���� ������ �����ϵ�,
--           ���� ���� �̸��� PK_MY_DEPT
CREATE TABLE DEPT_SAMPLE
AS
SELECT *
FROM DEPT
WHERE 1=2;

ALTER TABLE DEPT_SAMPLE
ADD CONSTRAINT PK_MY_DEPT PRIMARY KEY(DEPTNO);

-- �������� ���� ��ųʸ� SQL��
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT_COPY';

-- ���� 3) ��� ���̺��� �μ���ȣ �÷��� �������� �ʴ� �μ��� ����� �������� �ʵ���
--           �ܷ�Ű(FOREIGN KEY) ���������� �����ϵ�, FK_MY_DEPT_EMP��
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT FK_MY_DEPT_EMP
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);