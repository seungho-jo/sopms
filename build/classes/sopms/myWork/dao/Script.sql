create table wbs(
	workcode NUMBER PRIMARY KEY,
	title varchar2(100) NOT NULL,
	content varchar2(2000),
	start_date DATE NOT NULL,
	end_date date NOT NULL,
	duration NUMBER NOT NULL,
	pm varchar2(60) NOT null,
	manager varchar2(60) not null,
	spcode NUMBER NOT NULL,
	parent NUMBER,
	status varchar2(100) NOT null
);
CREATE TABLE works(
	workcode NUMBER not null,
	apprMsg varchar2(2000),
	compMsg varchar2(2000)
);
drop table works;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM 
(SELECT rownum AS no, a.* FROM wbs a
WHERE manager = '조승호')
WHERE NO BETWEEN 11 AND 20;
select count(*) from wbs
		where manager = '조승호';
SELECT a.*,b.COMPMSG FROM wbs a,works b
WHERE a.workcode = 4
AND a.WORKCODE = b.WORKCODE(+);
INSERT INTO works values('4','보고서 작성 완료 확인 부탁드립니다','',sysdate);
SELECT * FROM works;
DELETE FROM works;
CREATE TABLE workfile(
	workcode NUMBER,
	fname varchar2(200),
	regdate DATE,
	uptdate date
);
MERGE INTO works a
USING dual
ON (a.workcode = 6)
WHEN MATCHED THEN
	UPDATE SET a.apprmsg = '재 승인 요청부탁드립니다',
			   a.compmsg = '',
			   a.apprdate = sysdate
WHEN NOT MATCHED THEN
	INSERT values(8,'작업 승인 부탁드립니다','',sysdate);