-- 참고) ROLLBACK / COMMIT
-- 트랜잭션(Transaction)관리
-- ROLLBACK : DML(INSERT / UPDATE / DELETE) 실행 취소
-- COMMIT : DML(INSERT / UPDATE / DELETE) 실행 영구 반영
-- 예) 트랜잭션 시작
--     INSETR ~
--     UPDATE ~
--     DELETE ~
--     COMMIT[ROLLBACK] : 트랜잭션 종료 ( 1개의 트랜잭션 )

-- 참고 사항) AUTOCOMMIT : 자동 DB 영구 반영
--          Oracle DB : AUTOCOMMIT = FALSE로 되있음
--          MYSQL/MRIADB : AUTOCOMMIT = TRUE로 되있음

-- 연습 9) 접속한 유저의 테이블 목록을 보는 SQL 명령어
SELECT * FROM USER_TABLES;
SELECT * FROM EMP_INSERT;
SELECT * FROM EMP_COPY;

-- 연습문제 1) EMP 테이블의 구조만 복사하여 EMP_INSERT란 이름의 빈 테이블 만들기
CREATE TABLE EMP_INSERT
AS
SELECT *
FROM EMP
WHERE 1=2; -- 거짓조건을 만들어 내용은 안들어오고 구조만 가져옴

-- 연습문제 2) 본인을 EMP_INSERT(임시 직원테이블) 테이블에 추가하되,
-- SYSDATE를 이용하여 입사일을 오늘로 입력하기

-- 테이블 구조 보는 방법
DESC EMP_INSERT;
-- 컬럼 목록을 보는 딕셔너리 소개
SELECT * FROM USER_TAB_COLUMNS
ORDER BY TABLE_NAME, COLUMN_ID;
-- 테이블에 데이터 넣기
INSERT INTO EMP_INSERT(ENAME, HIREDATE)
VALUES('하보석', SYSDATE);

-- 연습문제 3) EMP_INSERT(임시 직원테이블) 테이블에 옆 사람을 추가하되, TO_DATE 함수를 이용하여 입사일을 어제로 입력하기
INSERT INTO EMP_INSERT(ENAME, HIREDATE)
VALUES('주건재', TO_DATE(SYSDATE-1, 'YY/MM/DD');

-- 연습문제 4) EMPLOYEE 테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 생성
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP;
-- 테이블 확인
SELECT * FROM EMP_COPY;

-- 연습 10) DML(데이터조작어) 실습
-- 연습문제 1. 사원번호가 7788인 사원의 부서번호를 10번으로 수정하기
UPDATE EMP_COPY
SET DEPTNO = 10
WHERE EMPNO = 7788;
SELECT * FROM EMP_COPY;

-- 연습문제 2. 사원번호가 7788의 담당 업무 및 급여를 사원번호 7499의 담당 업무 및 급여로 대체하기
UPDATE EMP_COPY
SET (JOB, SAL) = (SELECT JOB, SAL FROM EMP_COPY WHERE EMPNO = 7499)
WHERE EMPNO = 7788;

-- 연습문제 3. DEPARTMENT 테이블의 구조와 내용을 복사하여 DEPT_COPY라는 이름의 테이블을 생성하기
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPT;

-- 연습문제 4. DEPT_COPY 테이블에서 부서명이 RESEARCH인 부서를 제거하기
DELETE FROM DEPT_COPY
WHERE DNAME = 'RESEARCH';

-- 연습문제 5. DEPT_COPY 테이블에서 부서번호가 10이거나 40인 부서를 제거하기
DELETE FROM DEPT_COPY
WHERE DEPTNO IN (10, 40);

COMMIT;

-- 도전과제 10) DEPT_COPY 테이블에서 DNAME이 'SALES'이면 LOC에 'SEOUL'로 수정하고,
--             아니면 'BUSAN' 이라고 수정
UPDATE DEPT_COPY
SET LOC = DECODE(DNAME, 'SALES', 'SEOUL'
                               , 'BUSAN');
COMMIT;