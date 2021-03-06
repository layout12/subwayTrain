DROP SEQUENCE WRITESQ;
DROP TABLE MWRITE;

CREATE SEQUENCE WRITESQ;

CREATE TABLE MWRITE(
WRITENO NUMBER PRIMARY KEY,
ID VARCHAR2(50),
NICKNAME VARCHAR2(50),
TITLE VARCHAR2(1000) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
REGDATE DATE NOT NULL,
DELCHECK VARCHAR2(2) NOT NULL,
ROLE VARCHAR2(10) NOT NULL,


CONSTRAINT FK_ID FOREIGN KEY(ID)
REFERENCES MUSER(ID),

CONSTRAINT CHECK_ROLE2 CHECK(ROLE IN('ADMIN','USER')),
CONSTRAINT CHECK_DELCHECK CHECK(DELCHECK IN('Y','N'))
);

INSERT INTO MWRITE VALUES(WRITESQ.NEXTVAL,'ADMIN01','햄토리','관리자 입니다.','매너를 지켜주세요.',SYSDATE,'Y','ADMIN');
INSERT INTO MWRITE VALUES(WRITESQ.NEXTVAL,'USER01','APPLE','사과','맛있어!',SYSDATE,'Y','USER');

SELECT WRITENO, ID, NICKNAME, TITLE, CONTENT, REGDATE, DELCHECK, ROLE FROM
  	(SELECT ROWNUM AS RN, WRITENO, ID, NICKNAME, TITLE, CONTENT, REGDATE, DELCHECK, ROLE FROM
  	(SELECT * FROM MWRITE WHERE ROLE='ADMIN' AND TITLE LIKE '%12%' AND DELCHECK='Y'
  	ORDER BY WRITENO DESC))
  	WHERE RN BETWEEN 1 AND 10;

SELECT COUNT(*) FROM MWRITE WHERE ROLE='ADMIN' AND TITLE LIKE '%12%';
  	
SELECT * FROM MWRITE;