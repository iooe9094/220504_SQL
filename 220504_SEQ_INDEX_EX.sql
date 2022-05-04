-- [ SEQUENCE & INDEX 연습문제 ]
-- 연습 1) 사원 테이블의 사원번호가 자동으로 생성되도록 시퀀스를 생성
-- 시퀀스 이름 : SQ_EMP
CREATE SEQUENCE SQ_EMP
INCREMENT BY 1 START WITH 10
MAXVALUE 10000;

-- 연습 2) 사원 번호를 시퀀스로부터 발급 받기
-- 임시 사원 테이블 : EMP01
-- 컬럼명 : EMPNO NUMBER(4) PRIMARY KEY,
--            ENAME VARCHAR2(10),
--            HIREDATE DATE

CREATE TABLE EMP01 (
      EMPNO NUMBER(4) PRIMARY KEY,
      ENAME VARCHAR2(10),
      HIREDATE DATE
);
-- INSERT 이용하여 EMPNO 시퀀스 값을 추가 ( 이름이나 날짜는 알아서)

INSERT INTO EMP01
VALUES(SQ_EMP.NEXTVAL, 'SEOK', SYSDATE);

SELECT * FROM EMP01;

-- 연습 3) EMP01 테이블에 이름 컬럼에 INDEX를 생성 (인덱스이름: IDX_EMP01_ENAME)

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);
