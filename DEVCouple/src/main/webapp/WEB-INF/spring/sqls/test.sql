CREATE TABLE TESTMEMBER(
	ID VARCHAR2(2000) PRIMARY KEY,
	PW VARCHAR2(2000) NOT NULL,
	NAME VARCHAR2(2000) NOT NULL,
	EMAIL VARCHAR2(2000) NOT NULL,
	PHONE VARCHAR2(2000) NOT NULL,
	ADDRESS VARCHAR2(2000) NOT NULL,
	ADDONE VARCHAR2(2000) NOT NULL,
	DETAILADD VARCHAR2(2000),
	PROFILEIMG VARCHAR2(4000)
);

DROP TABLE TESTMEMBER;
delete from testmember where id = 'dongdong';
SELECT * FROM TESTMEMBER;
---------------------------------------------------------

DROP SEQUENCE TESTLETTERSEQ;
DROP TABLE TESTLETTER;

CREATE SEQUENCE TESTLETTERSEQ;
CREATE TABLE TESTLETTER(
	LETTERSEQ NUMBER(10) PRIMARY KEY,
	ID VARCHAR2(2000) NOT NULL,        --받는사람
	SENDER VARCHAR2(2000) NOT NULL,        --보내는사람
	LETTERTITLE VARCHAR2(3000) NOT NULL,    --제목
	LETTERCONTENT VARCHAR2(3000) NOT NULL,    --내용
	LETTERREAD NUMBER(10) NOT NULL,    -- 안읽음(1), 읽음(2)
	LETTERTIME DATE DEFAULT SYSDATE,     --보낸시간
	CONSTRAINT FK_TESTLETTER_GETTER FOREIGN KEY(ID)
	REFERENCES TESTMEMBER(ID) ON DELETE CASCADE
);

INSERT INTO TESTLETTER
VALUES(TESTLETTERSEQ.NEXTVAL,'guest','doma','제목테스트','내용테스트',1,sysdate);
SELECT * FROM TESTLETTER;

	SELECT *
		FROM
		(SELECT ROWNUM
     	 , B.*
  	 	 FROM (SELECT A.*
           	   FROM TESTLETTER A  
           	   WHERE A.LETTERREAD = 1 AND A.ID = 'guest'        	   
           	   ORDER BY A.LETTERSEQ DESC) B)
		WHERE ROWNUM = 1
		
	SELECT * FROM TESTLETTER
		WHERE ID='guest'
		ORDER BY LETTERSEQ DESC	
		
		SELECT B.*	
		FROM (SELECT A.*, ROWNUM AS ROWNUM
		FROM (SELECT * FROM TESTLETTER
		  WHERE ID='guest'
		  ORDER BY ID,LETTERTIME DESC) A) B	
		WHERE ROWNUM BETWEEN 11 AND 20  
		ORDER BY ROWNUM ASC
------------------------------------------------------------------------
DROP TABLE TESTBOARD;
DROP SEQUENCE TESTBOARDSEQ;
CREATE SEQUENCE TESTBOARDSEQ;
CREATE TABLE TESTBOARD(
	SEQ NUMBER(10) PRIMARY KEY,
	ID VARCHAR2(100) NOT NULL,
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(3000) NOT NULL,
	WRTDATE DATE DEFAULT SYSDATE,
	CNT NUMBER(10) NOT NULL
);

INSERT INTO TESTBOARD
VALUES(TESTBOARDSEQ.NEXTVAL,'BOBO','제목1','내용테스트',sysdate,0);

SELECT * FROM CHATROOM INNER JOIN CHATSTATUS ON CHATROOM.ROOMNO = CHATSTATUS.ROOMNO
ORDER BY CHATROOM.ROOMNO DESC;

SELECT * FROM CHATSTATUS ORDER BY ROOMNO DESC;