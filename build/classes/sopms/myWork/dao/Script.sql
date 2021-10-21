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
		WHERE NO BETWEEN 1 AND 5;
DELETE FROM project_dept
WHERE pcode = 14;

select count(*) from wbs
where manager = 'happy01';

SELECT * from
		(SELECT rownum AS no, b.* from
		(SELECT a.*,m.name as pm_name FROM wbs a,MEMBER m 
		WHERE manager = 'happy01'
		AND pm = m.id
		ORDER BY START_DATE DESC) b)
		WHERE no BETWEEN 1 AND 5;
		
select a.*,b.compmsg,b.apprmsg,b.reqmsg,c.fname,d.name AS pm_name from wbs a,works b,workfile c,MEMBER d
		where a.workcode = -9
		AND a.pm = d.id
		and a.workcode = b.workcode(+)
		AND a.workcode = c.workcode(+);
	SELECT * FROM wbs a, works b
		WHERE a.workcode = b.WORKCODE
		AND a.pm = 'happy02'
		AND a.status = '승인요청';
SELECT * from
		(SELECT rownum AS NO,a.*,b.APPRDATE,c.name FROM wbs a, works b, member c
		WHERE a.workcode = b.WORKCODE
		AND a.MANAGER = c.id
		AND a.pm = 'happy02'
		AND a.STATUS = '승인요청'
		ORDER BY b.APPRDATE desc)
		WHERE NO BETWEEN 1 AND 10;
SELECT a.*,b.DEPT FROM PROJECT a,PROJECT_DEPT b
WHERE a.PCODE = b.PCODE
AND a.pcode = 2;
SELECT * FROM PROJECT_DEPT 
WHERE dept = '개발1팀'
AND NOT pcode = 2;
SELECT * FROM PROJECT_DEPT
WHERE pcode = 2;

SELECT * FROM LESOURCE l;
SELECT * FROM MEMBER  a, PROJECT_DEPT b,PROJECT c
WHERE b.pcode = c.pcode
AND c.pcode = 2;




SELECT *
FROM MEMBER a
WHERE id NOT IN (SELECT m.id FROM LESOURCE l, MEMBER m
WHERE l.ID = m.id
AND pcode = 3);

SELECT m.id FROM LESOURCE l, MEMBER m
WHERE l.ID = m.id;


SELECT dept FROM PROJECT_DEPT pd 
WHERE pcode = 2;

SELECT * from
(SELECT *
FROM MEMBER a
WHERE id NOT IN (SELECT m.id FROM LESOURCE l, MEMBER m
WHERE l.ID = m.id
AND pcode = '2'))
WHERE dept = '개발1팀';






SELECT l.pcode,m.* FROM LESOURCE l, MEMBER m
WHERE l.ID = m.id;
SELECT * FROM LESOURCE WHERE PCODE = 2;
SELECT * FROM MEMBER a,
(SELECT * FROM LESOURCE WHERE PCODE = 2) b
WHERE not dept = '개발1팀'
AND b.id = a.id;
SELECT * FROM PROJECT_DEPT;
MERGE INTO RISKJOCHI a
USING risk b
ON (a.risk_no = b.risk_no)
WHEN MATCHED THEN 
UPDATE SET 
         a.id = b.id,
         a.RISK_JOCHICONT = b.risk_content,
         a.RISK_JOCHIUPT = sysdate
WHEN NOT MATCHED THEN 
INSERT (a.risk_no, id, RISK_JOCHICONT, RISK_JOCHIUPT) 
VALUES (1, 'happy02', 'testing', sysdate);


SELECT L.PCODE, L.ID 
FROM LESOURCE L, (
SELECT PCODE,DEPT FROM PROJECT_DEPT WHERE PCODE='2'
) D
WHERE L.PCODE = D.PCODE;

SELECT M.NAME, M.DEPT, M.RANK, M.INSERTPJDAY --DEPT 테이블과 MEMBER테이블을 조인 
FROM MEMBER M, PROJECT_DEPT D
WHERE M.DEPT = D.DEPT;
SELECT * from
(SELECT  rownum AS NO,d.* from
(SELECT a.title,b.fname,c.name AS m_name,regdate
FROM wbs a,workfile b,MEMBER c
WHERE a.WORKCODE = b.WORKCODE 
AND a.MANAGER = c.id
AND a.PARENT = 2) d)
WHERE NO BETWEEN 1 AND 10
ORDER BY NO desc;

SELECT count(*) FROM WORKFILE a,wbs b,project c
WHERE a.WORKCODE = b.WORKCODE 
AND b.PARENT = c.PCODE
AND c.pcode = 2;

select a.*,b.reqmsg,c.fname,d.name AS m_name 
from wbs a,works b,workfile c,MEMBER d
where a.workcode = -2
AND a.manager = d.id
and a.workcode = b.workcode(+)
AND a.workcode = c.workcode(+);

SELECT * FROM 
(SELECT rownum cnt,a.* FROM
(SELECT b.*,m.name
from board b,MEMBER m
WHERE b.id = m.id
AND btitle LIKE '%'||''||'%'
AND m.name LIKE '%'||''||'%'ORDER BY bcode) a)
WHERE cnt BETWEEN 1 AND 10
ORDER BY bcode desc;
SELECT reqdate FROM works;

SELECT * from
		(SELECT  rownum AS NO,e.* from
		(SELECT a.title,b.fname,c.name AS m_name,reqdate
		FROM wbs a,workfile b,MEMBER c,works d
		WHERE a.WORKCODE = b.WORKCODE 
		and a.workcode = d.workcode
		AND a.MANAGER = c.id
		AND a.PARENT = 2) e)
		WHERE NO BETWEEN 1 AND 10
		ORDER BY NO DESC;
		
SELECT * from
		(SELECT  rownum AS cnt,e.* from
		(SELECT a.title,b.fname,c.name AS m_name,reqdate
		FROM wbs a,workfile b,MEMBER c,works d
		WHERE a.WORKCODE = b.WORKCODE 
		and a.workcode = d.workcode
		AND a.MANAGER = c.id
		AND a.PARENT = 2) e
		WHERE rownum BETWEEN 1 AND 5
		ORDER BY rownum desc);
SELECT * from	
		(SELECT * from
		(SELECT rownum AS cnt,a.title,b.fname,c.name AS m_name,reqdate
		FROM wbs a,workfile b,MEMBER c,works d
		WHERE a.WORKCODE = b.WORKCODE 
		and a.workcode = d.workcode
		AND a.MANAGER = c.id
		AND a.PARENT = 2
		ORDER BY reqdate DESC) e);
SELECT * FROM 
	(SELECT * from
(SELECT rownum NO, a.title,b.fname,c.name AS m_name,reqdate
		FROM wbs a,workfile b,MEMBER c,works d
		WHERE a.WORKCODE = b.WORKCODE 
		and a.workcode = d.workcode
		AND a.MANAGER = c.id
		AND a.PARENT = 2
		ORDER BY reqdate desc)
		WHERE NO <=5)
		WHERE NO >=1;
		
SELECT * from
		(SELECT  rownum AS NO,e.* from
		(SELECT a.title,b.fname,c.name AS m_name,to_char(reqdate,'YYYY-MM-DD') AS reqdate
		FROM wbs a,workfile b,MEMBER c,works d
		WHERE a.WORKCODE = b.WORKCODE 
		and a.workcode = d.workcode
		AND a.MANAGER = c.id
		AND a.PARENT = 2) e)
		WHERE NO BETWEEN 1 AND 5
		ORDER BY reqdate DESC;
		
SELECT * from
		(SELECT rownum AS NO,a.*,b.reqdate,c.name as m_name
		 FROM wbs a, works b,member c
		WHERE a.workcode = b.WORKCODE
		AND a.MANAGER = c.id
		AND a.pm = 'happy02'
		AND a.STATUS = '승인요청'
		ORDER BY b.APPRDATE desc)
		WHERE NO BETWEEN 1 AND 5;
SELECT (end_date-start_date) AS duration,DURATION FROM wbs;
SELECT * FROM user_triggers;

SELECT * from
		(SELECT rownum AS no, b.* from
		(SELECT a.*,m.name as pm_name, p.pname FROM wbs a,MEMBER m,project p
		WHERE manager = 'happy01'
		and a.PARENT = p.pcode
		AND pm = m.id
    	and a.status like  '%'||'승인'||'%' 
    	and title like '%'||''||'%' 
		ORDER BY START_DATE DESC) b)
		WHERE no BETWEEN 1 AND 5;
		
SELECT * from
		(SELECT  rownum AS NO,e.* from
		(SELECT a.title,b.fname,c.name AS m_name,to_char(reqdate,'YYYY-MM-DD') AS reqdate
		FROM wbs a,workfile b,MEMBER c,works d
		WHERE a.WORKCODE = b.WORKCODE 
		and a.workcode = d.workcode
		and a.status = '종료됨'
		AND a.MANAGER = c.id
		AND a.PARENT = 2) e)
		WHERE NO BETWEEN 1 AND 5
		ORDER BY reqdate DESC;
		
	SELECT count(*) FROM WORKFILE a,wbs b,project c
		WHERE a.WORKCODE = b.WORKCODE 
		and b.status = '종료됨'
		AND b.PARENT = c.PCODE
		AND c.pcode = 2;
SELECT * from
(SELECT count(*) FROM WBS
WHERE MANAGER = 'happy01'
AND status = '진행중') a,
(SELECT count(*) FROM WBS
WHERE MANAGER = 'happy01') b,
(SELECT count(*) FROM WBS
WHERE MANAGER = 'happy01'
AND status = '종료됨')c;
SELECT count(*) FROM LESOURCE l 
WHERE l.ID = 'happy01';
SELECT a.* FROM project a,LESOURCE l 
WHERE a.PCODE = l.PCODE 
AND l.id = 'happy01';


SELECT * from
		(SELECT rownum AS no, b.* from
		(SELECT a.*,m.name as pm_name, p.pname FROM wbs a,MEMBER m,project p
		WHERE manager = 'happy01'
		and a.parent = p.pcode
		AND pm = m.id
		ORDER BY START_DATE) b
		ORDER BY rownum desc)
		WHERE no <= 5;
	SELECT a.*,m.name AS pm_name,(a.enddate-a.startdate) AS duration FROM project a,LESOURCE l,member m
		WHERE a.PCODE = l.PCODE 
		AND l.id = 'happy01'
		and a.id = m.id;
SELECT * from
		(SELECT count(*) procwork FROM WBS
		WHERE MANAGER = 'happy02'
		AND status = '진행중') a,
		(SELECT count(*) totwork FROM WBS
		WHERE MANAGER = 'happy02') b,
		(SELECT count(*) endwork FROM WBS
		WHERE MANAGER = 'happy02'
		AND status = '종료됨')c,
		(SELECT count(*) attpj FROM LESOURCE l
		WHERE l.ID = 'happy02') d;