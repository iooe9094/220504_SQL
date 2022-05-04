-- 유저 만들기

-- SCOTT 유저 권한 상승 : 롤(ROLE : 여러 권한들을 모두 모아놨음)
-- CONNECT (접속에 관련된 권한 모음)
-- RESOURCE (테이블, 뷰, 프로시저 생성, 권한)
-- DBA (유저, DB관리 등 최상위 권한)
-- 권한 상승 시키는 롤
grant connect, resource, dba to scott;
grant create user to scott;

-- 유저 생성
-- 오라클 공간 관리 영역 : TABLESPACE
-- 아래 순서대로 명령프롬프트에 입력하기
CREATE USER GUEST01 IDENTIFIED BY 1111;
DEFAULT TABLESPACE USERS;
TEMPORARY TABLESPACE TEMP;

SHOW USER;
grant connect, resource to GUEST01;

conn guest01/1111;

-- 권한 종류
-- CREATE TABLE : 테이블 생성 권한
-- CREATE VIEW : 뷰 생성 권한
-- CREATE SEQUENCE : 시퀀스 생성 권한

-- 권한부여 명령어
-- GRANT 권한[롤] TO 유저명

-- 동의어 : 테이블 : SELECT * FROM SCOTT3.EMPLOYEE 별칭으로 변경해서 이름을 정의해줄 수 있음

-- 연습 1) KBS라는 사용자를 생성하고, 암호는 1234로 만들기
-- DEFAULT TABLESPACE 명은 USERS를 사용
-- TEMPORARY TABLESPACE 명은 TEMP 사용
CREATE USER KBS IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 연습 2) 1번에서 생성한 유저에 CONNECT, RESOURCE 권한(롤)을 부여하세요
grant connect, resource to KBS;