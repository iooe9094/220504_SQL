-- 220504 ��(VIEW) �ǽ�
-- ��(VIEW) : ���� ���̺� (������ �Ҵ�Ǿ �����ϰ� ���� ����)
-- �信 ����� �� : SQL��(SELECT��)
-- ��) ���̺� : ���� �Ҵ�Ǿ� ��ũ�� ���� <-> ��(VIEW)

-- ��)
-- �� ���� ���� �ֱ�(sys, system ������ ����)
-- grant ���� to ����
grant create any view to scott;
-- �� ���� ���� ����
-- revoke ���� from ����
revoke create any view from scott;

CREATE OR REPLACE VIEW VW_EMP_JOB
AS
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE JOB LIKE '%SALES%';

SELECT * FROM VW_EMP_JOB;

-- ��� ���̺��� �޿� ������ ���ԵǾ� �ֽ��ϴ�. (�޿����� : ���(��ܺ�))
CREATE VIEW V_EMP_SAMPLE
AS
SELECT EMPNO, ENAME, JOB, MGR, DEPTNO
FROM EMP;

-- �������) ������ ������ �� ����� ���� ���� �� ��ȸ�ϴ� ��ųʸ�
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- �׷��Լ��� �� SELECT���� ��(VIEW)�� �����
CREATE OR REPLACE VIEW VW_EMP_SAL
AS
SELECT DEPTNO,
SUM(SAL) AS "�ѱ޿�",
TRUNC(AVG(SAL)) AS "��ձ޿�"
FROM EMP
GROUP BY DEPTNO; -- �����߻� : SELECT�� �׷��Լ��� �ִ� �÷��� ��Ī�� �־�� ��

-- �� �����ϱ�
SELECT * FROM USER_VIEWS;
DROP VIEW VW_EMP_JOB;
DROP VIEW V_EMP_SAMPLE;
DROP VIEW VW_EMP_SAL;