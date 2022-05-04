-- [ SEQUENCE & INDEX �������� ]
-- ���� 1) ��� ���̺��� �����ȣ�� �ڵ����� �����ǵ��� �������� ����
-- ������ �̸� : SQ_EMP
CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 10
MAXVALUE 10000;

-- ���� 2) ��� ��ȣ�� �������κ��� �߱� �ޱ�
-- �ӽ� ��� ���̺� : EMP01
-- �÷��� : EMPNO NUMBER(4) PRIMARY KEY,
--            ENAME VARCHAR2(10),
--            HIREDATE DATE

CREATE TABLE EMP01 (
      EMPNO NUMBER(4) PRIMARY KEY,
      ENAME VARCHAR2(10),
      HIREDATE DATE
);
-- INSERT �̿��Ͽ� EMPNO ������ ���� �߰� ( �̸��̳� ��¥�� �˾Ƽ�)

INSERT INTO EMP01
VALUES(SQ_EMP.NEXTVAL, 'SEOK', SYSDATE);

SELECT * FROM EMP01;

-- ���� 3) EMP01 ���̺� �̸� �÷��� INDEX�� ���� (�ε����̸�: IDX_EMP01_ENAME)

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);
