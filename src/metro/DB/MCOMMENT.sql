DROP TABLE MCOMMENT;

CREATE TABLE MCOMMENT(
WRITENO NUMBER NOT NULL,
COMMENTNO NUMBER NOT NULL,
ID VARCHAR2(50),
NICKNAME VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
REGDATE DATE NOT NULL,
DELCHECK VARCHAR2(2) NOT NULL,

CONSTRAINT PK_NO PRIMARY KEY(WRITENO, COMMENTNO),

CONSTRAINT FK_WRITENO FOREIGN KEY(WRITENO)
REFERENCES MWRITE(WRITENO),

CONSTRAINT FK_ID2 FOREIGN KEY(ID)
REFERENCES MUSER(ID),

CONSTRAINT CHECK_DELCHECK2 CHECK(DELCHECK IN('Y','N'))
);

INSERT INTO MCOMMENT VALUES(21,1,'ADMIN01','햄토리','반가워요~',SYSDATE,'Y');
INSERT INTO MCOMMENT VALUES(21,2,'USER01','APPLE','A',SYSDATE,'Y');

INSERT INTO MCOMMENT VALUES(22,1,'ADMIN01','햄토리','홍옥 맛있어요',SYSDATE,'Y');
INSERT INTO MCOMMENT VALUES(22,2,'USER01','APPLE','맞아요 홍옥 맛있어요!',SYSDATE,'Y');

SELECT * FROM MCOMMENT;

SELECT COUNT(*) FROM MCOMMENT WHERE WRITENO=21;

SELECT WRITENO, COMMENTNO, ID, NICKNAME, CONTENT, REGDATE, DELCHECK FROM (SELECT ROWNUM AS RN, WRITENO, COMMENTNO, ID, NICKNAME, CONTENT, REGDATE, DELCHECK FROM (SELECT * FROM MCOMMENT WHERE WRITENO=22 ORDER BY COMMENTNO)) WHERE RN BETWEEN 1 AND 10