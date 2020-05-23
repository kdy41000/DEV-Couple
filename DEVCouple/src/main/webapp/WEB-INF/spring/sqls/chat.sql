CREATE TABLE TESTMEMBER(          --사용자 정보 테이블
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
select * from testmember;
-----------------------------------------------------------------
DROP SEQUENCE CHATROOMSEQ;
CREATE SEQUENCE CHATROOMSEQ;

DROP TABLE CHATROOM;   -- 채팅방
CREATE TABLE CHATROOM(
   ROOMNO NUMBER(10) PRIMARY KEY,    -- PK
   ROOMNAME VARCHAR2(1000),      -- 채팅방 이름
   ROOMDESCRIPTION VARCHAR2(2000),    -- 채팅방 설명
   MAKETIME DATE DEFAULT SYSDATE     -- 개설일
);

DROP SEQUENCE CHATSTATUSSEQ;
CREATE SEQUENCE CHATSTATUSSEQ;

DROP TABLE CHATSTATUS; --개인의 채팅방 상태
CREATE TABLE CHATSTATUS(                -- 채팅방 상태(접속자 수 , 방장, 일반멤버 등)
   STATUSNO NUMBER(10) PRIMARY KEY,     -- PK
   CONNECTSTATUS NUMBER(2) NOT NULL,    -- 접속상태(비접속(0),접속(1))
   ROOMNO NUMBER(10) NOT NULL,          -- FK(방 번호)
   ID VARCHAR2(2000),                   -- FK(유저아이디)
   GRADE NUMBER(2) NOT NULL,            -- 등급(방장(1), 일반멤버(2))
   CONSTRAINT FK_CHATSTATUS_ROOMNO FOREIGN KEY(ROOMNO)
   REFERENCES CHATROOM(ROOMNO) ON DELETE CASCADE,
   CONSTRAINT FK_CHATSTATUS_ID FOREIGN KEY(ID)
   REFERENCES TESTMEMBER(ID) ON DELETE CASCADE
);

DROP SEQUENCE CHATMSGSEQ;
CREATE SEQUENCE CHATMSGSEQ;

DROP TABLE CHATMSG;
CREATE TABLE CHATMSG(
   MSGNO NUMBER(10) PRIMARY KEY,
   ROOMNO NUMBER(10) NOT NULL,            -- FK
   WRITE_ID VARCHAR2(2000),                     -- FK(보낸 아이디(글쓴이)
   MSG VARCHAR2(2000),                    -- 채팅내용
   SENDTIME DATE DEFAULT SYSDATE,         -- 보낸시간(DESC)
   CONSTRAINT FK_CHATMSG_ROOMNO FOREIGN KEY(ROOMNO)
   REFERENCES CHATROOM(ROOMNO) ON DELETE CASCADE,
   CONSTRAINT FK_CHATMSG_ID FOREIGN KEY(WRITE_ID)
   REFERENCES TESTMEMBER(ID) ON DELETE CASCADE
);

DROP SEQUENCE READSTATUSSEQ;
CREATE SEQUENCE READSTATUSSEQ;

DROP TABLE READSTATUS;
CREATE TABLE READSTATUS(
   READSTATUSNO NUMBER(10) PRIMARY KEY,
   MSGNO NUMBER(10) NOT NULL,      -- 메세지 번호
   MY_ID VARCHAR2(2000),           -- 내아이디 
   READSTATUS NUMBER(2) NOT NULL,    -- 읽은 상태(읽음(0), 안읽음(1))
   CONSTRAINT FK_READSTATUS_MSGNO FOREIGN KEY(MSGNO)
   REFERENCES CHATMSG(MSGNO) ON DELETE CASCADE,
   CONSTRAINT FK_READSTATUS_MYID FOREIGN KEY(MY_ID)
   REFERENCES TESTMEMBER(ID) ON DELETE CASCADE
);

DROP TABLE REPLYBOARD;
DROP SEQUENCE REPLYBOARDSEQ;
CREATE SEQUENCE REPLYBOARDSEQ;
CREATE TABLE REPLYBOARD(
   REPLYSEQ NUMBER(10) PRIMARY KEY,    -- PK
   SEQ NUMBER(10) NOT NULL,            -- FK(게시판SEQ)
    WRITER VARCHAR2(100) NOT NULL,      -- FK(댓글 작성자)
    REPLYCONTENT VARCHAR2(3000) NOT NULL,   -- 댓글 내용
    REPLYDATE DATE DEFAULT SYSDATE,     -- 댓글 작성날짜
    STAR NUMBER(10),                    -- 별점(1 ~ 5)
    CONSTRAINT FK_REPLYBOARD_SEQ FOREIGN KEY(SEQ)
    REFERENCES TESTBOARD(SEQ) ON DELETE CASCADE,
    CONSTRAINT FK_REPLYBOARD_WRITER FOREIGN KEY(WRITER)
    REFERENCES TESTMEMBER(ID) ON DELETE CASCADE
);

select * from chat;
INSERT INTO CHAT
VALUES(ROOMNOSEQ.NEXTVAL,'테스트채팅방2','테스트를 위한 채팅방입니다.',sysdate,'guest',null,null,null);

SELECT * FROM CHATSTATUS INNER JOIN TESTMEMBER ON CHATSTATUS.ID = TESTMEMBER.ID
WHERE CHATSTATUS.CONNECTSTATUS = 1
ORDER BY CHATSTATUS.STATUSNO DESC;

SELECT COUNT(*) FROM CHATSTATUS
WHERE CONNECTSTATUS = 1 AND ID='guest' AND ROOMNO=1;

SELECT COUNT(*) FROM CHATSTATUS
WHERE ID='guest' AND ROOMNO=4;

select * from chatstatus;

DELETE FROM CHATSTATUS;

SELECT * FROM CHATROOM
WHERE ROOMNO = 4;

SELECT * FROM CHATROOM INNER JOIN CHATSTATUS ON CHATROOM.ROOMNO = CHATSTATUS.ROOMNO INNER JOIN TESTMEMBER ON CHATSTATUS.ID = TESTMEMBER.ID
WHERE CHATSTATUS.ROOMNO = 10 AND CHATSTATUS.ID = 'guest';

select * from chatstatus;

