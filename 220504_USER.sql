-- ���� �����

-- SCOTT ���� ���� ��� : ��(ROLE : ���� ���ѵ��� ��� ��Ƴ���)
-- CONNECT (���ӿ� ���õ� ���� ����)
-- RESOURCE (���̺�, ��, ���ν��� ����, ����)
-- DBA (����, DB���� �� �ֻ��� ����)
-- ���� ��� ��Ű�� ��
grant connect, resource, dba to scott;
grant create user to scott;

-- ���� ����
-- ����Ŭ ���� ���� ���� : TABLESPACE
-- �Ʒ� ������� ���������Ʈ�� �Է��ϱ�
CREATE USER GUEST01 IDENTIFIED BY 1111;
DEFAULT TABLESPACE USERS;
TEMPORARY TABLESPACE TEMP;

SHOW USER;
grant connect, resource to GUEST01;

conn guest01/1111;

-- ���� ����
-- CREATE TABLE : ���̺� ���� ����
-- CREATE VIEW : �� ���� ����
-- CREATE SEQUENCE : ������ ���� ����

-- ���Ѻο� ��ɾ�
-- GRANT ����[��] TO ������

-- ���Ǿ� : ���̺� : SELECT * FROM SCOTT3.EMPLOYEE ��Ī���� �����ؼ� �̸��� �������� �� ����

-- ���� 1) KBS��� ����ڸ� �����ϰ�, ��ȣ�� 1234�� �����
-- DEFAULT TABLESPACE ���� USERS�� ���
-- TEMPORARY TABLESPACE ���� TEMP ���
CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- ���� 2) 1������ ������ ������ CONNECT, RESOURCE ����(��)�� �ο��ϼ���
grant connect, resource to KBS;