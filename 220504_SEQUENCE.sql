-- SEQUENCE 생성
-- 개발할 때 키값(ID) : 자동 증가하는 값을 사용
-- SEQUENCE : DB 자동 증가하는 값을 만들어줄 수 있음(채번)
-- 예) 시작 값이 10이고 1씩 증가하는 시퀀스 생성하기 (이름: SQ_EMP)

-- 문법) 
-- CREATE SEQUENCE 시퀀스이름
-- START WITH N : 시퀀스 번호의 시작 지정
-- INCREMENT BY N : N씩 증가
-- MINVALUE N : N 시퀀스 최소값
-- MAXVALUE N : N 시퀀스 최대값

CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 10;

-- 시퀀스 목록 확인 딕셔너리
SELECT * FROM USER_SEQUENCES;

-- 시퀀스 테스트 : 증가 확인
-- 시퀀스 증가시키기 ( SELECT 시퀀스이름.NEXTVAL )
SELECT SQ_EMP.NEXTVAL FROM DUAL;
-- 시퀀스 현재값 확인하기 ( SELECT 시퀀스이름.CURRVAL )
SELECT SQ_EMP.CURRVAL FROM DUAL; -- CURRVAL : 현재값

-- 개발 예)
-- 부서 번호를 위한 시퀀스 생성
CREATE SEQUENCE SQ_DEPT
INCREMENT BY 1 START WITH 1;

-- 테스트용 빈 부서테이블 생성
CREATE TABLE DEPT_COPY02
AS
SELECT * FROM DEPARTMENT
WHERE 1=2;

-- 데이터 추가하기
INSERT INTO DEPT_COPY02
-- 넘버링 시 SQ_DEPT.NEXTVAL 사용하면 중복값 없이 사용 가능함
VALUES(SQ_DEPT.NEXTVAL, 'ACCOUNTING', 'NEW YORK');

-- 확인하기
SELECT * FROM DEPT_COPY02;

-- 시퀀스 제거하기
-- 시퀀스는 되돌리기가 없으므로 DROP 사용하여 제거
DROP SEQUENCE SQ_DEPT;
DROP SEQUENCE SQ_EMP;