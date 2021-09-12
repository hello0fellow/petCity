  CREATE TABLE "MEMBER"   (
    "ID" VARCHAR2(20 BYTE) NOT NULL, 
	"PW" VARCHAR2(20 BYTE) NOT NULL,
	"NAME" VARCHAR2(20 BYTE) NOT NULL, 
	"EMAIL" VARCHAR2(50 BYTE) NOT NULL, 
	"NICKNAME" VARCHAR2(50 BYTE) NOT NULL, 
	 CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
    );
    
DELETE from member;
commit;
select * from member;
select count(*) from member;
select * from member order by id desc;

insert into member (id, pw, name, email, nickname)
		values ('hong', '123456', '??øª', '1@1', '?øª');