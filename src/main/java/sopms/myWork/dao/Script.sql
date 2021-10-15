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
	reqmsg varchar2(2000),
	apprMsg varchar2(2000),
	compMsg varchar2(2000),
	apprdate date
);
INSERT INTO works VALUES (6,'작업 완료하였습니다 확인해주세요',null,null,to_date('2021/10/13 09:30:54','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO works VALUES (7,'작업 완료하였습니다',null,null,to_date('2021/10/12 17:43:30','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO works VALUES (8,'승인 부탁드립니다',null,null,to_date('2021/10/13 15:19:49','YYYY-MM-DD HH24:MI:SS'));
SELECT * FROM USER_SEQUENCES;
SELECT * from
(SELECT rownum AS no, b.* from
(SELECT a.* FROM wbs a
WHERE manager = '조승호'
ORDER BY START_DATE DESC) b)
WHERE no BETWEEN 1 AND 5;
SELECT * FROM 
(SELECT rownum AS no, a.* FROM wbs a
WHERE manager = '조승호'
ORDER BY START_DATE desc)
WHERE NO BETWEEN 1 AND 5;
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
SELECT * from
(SELECT rownum AS NO,a.*,b.APPRDATE FROM wbs a, works b
WHERE a.workcode = b.WORKCODE
AND a.pm = '김재성'
AND a.STATUS = '진행중'
ORDER BY b.APPRDATE desc)
WHERE NO BETWEEN 1 AND 5;
SELECT count(*) FROM wbs a, works b
WHERE a.workcode = b.WORKCODE
AND a.pm = '김재성';
SELECT a.*,b.compmsg,b.APPRMSG FROM wbs a, works b
WHERE a.WORKCODE = b.WORKCODE(+) 
AND a.WORKCODE = 8;
MERGE INTO (SELECT a.status ,b.COMPMSG FROM wbs a, works b
WHERE a.WORKCODE = b.WORKCODE(+) 
AND a.WORKCODE = 10)
USING dual
ON (WORKCODE = 6)
WHEN MATCHED then
UPDATE SET STATUS = '반려됨',
		   COMPMSG = '오류수정없이 제출하였는데 수정하시고 다시 승인요청해주세요';
SELECT a.WORKCODE ,a.status, b.compmsg
FROM wbs a RIGHT JOIN WORKS b
ON(a.WORKCODE = b.workcode);
UPDATE  wbs a RIGHT JOIN works b ON(b.WORKCODE = a.WORKCODE)
SET a.status = '반려됨',
	b.compmsg = '오류수정없이 제출하였는데 수정하시고 다시 승인요청해주세요'
WHERE a.WORKCODE = 8;
select a.*,b.reqmsg,b.compmsg,b.apprmsg from wbs a,works b
		where a.workcode = 6
		and a.workcode = b.workcode(+);
select count(*) from wbs
where manager = '조승호';
select * from 
		(select rownum as no, a.*, b.risk_cnt from project a, risk b
		where  a.pcode = b.pcode(+)
		and a.id = 'happy02')
		where no between 1 and 10;
select * from(
select rownum as NO, a.*, NVL(b.risk_cnt,0) AS risk_cnt FROM project a,
(SELECT a.pcode, count(*) AS risk_cnt FROM project a, risk b
WHERE a.PCODE = b.PCODE 
AND a.id = 'happy02'
GROUP BY a.pcode) b
WHERE a.PCODE = b.PCODE(+)
AND a.id = 'happy02')
where no between 1 and 10;
SELECT * from
		(SELECT rownum AS NO,a.*,b.APPRDATE FROM wbs a, works b
		WHERE a.workcode = b.WORKCODE
		AND a.pm = '김재성'
		AND a.STATUS = '승인요청'
		ORDER BY b.APPRDATE desc)
		WHERE NO BETWEEN 1 AND 5
		
select a.*,b.compmsg,b.apprmsg,b.reqmsg,c.fname from wbs a,works b,workfile c
		where a.workcode = -7
		and a.workcode = b.workcode(+)
		AND a.workcode = c.workcode(+);