-- SEQUENCE ����
-- ������ �� Ű��(ID) : �ڵ� �����ϴ� ���� ���
-- SEQUENCE : DB �ڵ� �����ϴ� ���� ������� �� ����(ä��)
-- ��) ���� ���� 10�̰� 1�� �����ϴ� ������ �����ϱ� (�̸�: SQ_EMP)

-- ����) 
-- CREATE SEQUENCE �������̸�
-- START WITH N : ������ ��ȣ�� ���� ����
-- INCREMENT BY N : N�� ����
-- MINVALUE N : N ������ �ּҰ�
-- MAXVALUE N : N ������ �ִ밪

CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 10;

-- ������ ��� Ȯ�� ��ųʸ�
SELECT * FROM USER_SEQUENCES;

-- ������ �׽�Ʈ : ���� Ȯ��
-- ������ ������Ű�� ( SELECT �������̸�.NEXTVAL )
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- ������ ���簪 Ȯ���ϱ� ( SELECT �������̸�.CURRVAL )
SELECT SQ_EMP.CURRVAL FROM DUAL; -- CURRVAL : ���簪

-- ���� ��)
-- �μ� ��ȣ�� ���� ������ ����
CREATE SEQUENCE SQ_DEPT
INCREMENT BY 1 START WITH 1;

-- �׽�Ʈ�� �� �μ����̺� ����
CREATE TABLE DEPT_COPY02
AS
SELECT * FROM DEPARTMENT
WHERE 1=2;

-- ������ �߰��ϱ�
INSERT INTO DEPT_COPY02
-- �ѹ��� �� SQ_DEPT.NEXTVAL ����ϸ� �ߺ��� ���� ��� ������
VALUES(SQ_DEPT.NEXTVAL, 'ACCOUNTING', 'NEW YORK');

-- Ȯ���ϱ�
SELECT * FROM DEPT_COPY02;

-- ������ �����ϱ�
-- �������� �ǵ����Ⱑ �����Ƿ� DROP ����Ͽ� ����
DROP SEQUENCE SQ_DEPT;
DROP SEQUENCE SQ_EMP;