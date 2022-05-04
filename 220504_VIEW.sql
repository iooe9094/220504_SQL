-- 220504 뷰(VIEW) 실습
-- 뷰(VIEW) : 가상 테이블 (공간이 할당되어서 저장하고 있지 않음)
-- 뷰에 저장된 것 : SQL문(SELECT문)
-- 비교) 테이블 : 공간 할당되어 디스크에 저장 <-> 뷰(VIEW)

-- 예)
-- 뷰 생성 권한 주기(sys, system 계정만 가능)
-- grant 권한 to 계정
grant create any view to scott;
-- 뷰 생성 권한 뺏기
-- revoke 권한 from 계정
revoke create any view from scott;

CREATE OR REPLACE VIEW VW_EMP_JOB
AS
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP
WHERE JOB LIKE '%SALES%';

SELECT * FROM VW_EMP_JOB;

-- 사원 테이블에는 급여 정보가 포함되어 있습니다. (급여정보 : 비밀(대외비))
CREATE VIEW V_EMP_SAMPLE
AS
SELECT EMPNO, ENAME, JOB, MGR, DEPTNO
FROM EMP;

-- 참고사항) 접속한 유저의 뷰 목록을 보고 싶을 때 조회하는 딕셔너리
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

-- 그룹함수를 쓴 SELECT문을 뷰(VIEW)로 만들기
CREATE OR REPLACE VIEW VW_EMP_SAL
AS
SELECT DEPTNO,
SUM(SAL) AS "총급여",
TRUNC(AVG(SAL)) AS "평균급여"
FROM EMP
GROUP BY DEPTNO; -- 에러발생 : SELECT문 그룹함수가 있는 컬럼에 별칭을 주어야 함

-- 뷰 삭제하기
SELECT * FROM USER_VIEWS;
DROP VIEW VW_EMP_JOB;
DROP VIEW V_EMP_SAMPLE;
DROP VIEW VW_EMP_SAL;