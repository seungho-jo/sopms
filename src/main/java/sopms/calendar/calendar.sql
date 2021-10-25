CREATE TABLE calendar(
id number primary KEY, -- 일정id
workcode NUMBER, -- 프로젝트id (fullcalendar에서 등록한 일정의 값은 0, wbs는 시퀀스 값)
title varchar2(100) NOT null, -- 일정명
content varchar2(1000),  -- 일정내용
start1 varchar2(50) NOT null,  -- 시작일
end1 varchar2(50) NOT null,  -- 종료일
allDay number(1),  -- 종일여부 1=종일, 0=시간별
borderColor varchar2(50), -- 일정테두리색
backgroundColor varchar2(50), -- 일정배경색
textColor varchar2(50), -- 일정폰트색
pm varchar2(60), -- 일정 관리자명
manager varchar2(60), -- 일정 등록자명
parent NUMBER, -- 상위 프로젝트 번호
process NUMBER -- 진행률
);
		SELECT id, workcode,
			title, content,
			TO_char(start1, 'YYYY-MM-DD"T"HH24:MI:SS') start1, 
			TO_char(end1, 'YYYY-MM-DD"T"HH24:MI:SS') end1, 
			ALLDAY, 
			COLOR,
			pmcolor,
			manager,
			process 
		FROM calendar;
create sequence cal_seq 
start with 1 
increment by 1 
minvalue 1 
maxvalue 99999;
DROP SEQUENCE cal_seq;
DROP TABLE calendar;

insert into calendar values( cal_seq.nextval, '2', 'DB설계','DB',
		'2021-10-03T15:00:00', '2021-10-04T15:00:00',0,'#0099cc','조승호',20);

SELECT a.WORKCODE, a.TITLE, a.CONTENT, TO_CHAR(a.START_DATE, 'YY/MM/DD'),TO_CHAR(a.end_DATE, 'YY/MM/DD'), a.PM, a.MANAGER, a.PARENT FROM wbs a;
SELECT * FROM calendar;
SELECT * FROM wbs;
SHOW ERRORS TRIGGER cal_insert;
SELECT a.*, b.name
FROM calendar a, MEMBER b
WHERE a.MANAGER = b.id
AND a.MANAGER = 'happy01';
-- 삽입 트리거
CREATE OR REPLACE TRIGGER insert_trigger
AFTER insert ON wbs
FOR EACH ROW
BEGIN
	INSERT INTO calendar
	VALUES (cal_seq.nextval, :NEW.workcode, :NEW.title, :NEW.content, to_char(:NEW.start_date,'YYYY-MM-DD"T"00:00:00.000"Z"'), to_char(:NEW.end_date,'YYYY-MM-DD"T"00:00:00.000"Z"'), 1, '#6633FF', '#6633FF', '#FFFFFF', :NEW.pm, :NEW.manager, :NEW.parent, NULL, :NEW.status);
END;
INSERT INTO wbs values(140, '테스트', '테스트', '2021/06/21', '2021/07/20', 30, 'happy02', 'happy01', NULL, '종료됨');
-- 업데이트 트리거
select *
from
   user_errors
where
   type = 'TRIGGER'
and
   name = 'cal_insert';
SELECT * FROM USER_triggers;
CREATE OR REPLACE TRIGGER update_trigger
AFTER update ON wbs
FOR EACH ROW
BEGIN
	UPDATE calendar 
		SET workcode = :NEW.workcode,
			title = :NEW.title,
			content = :NEW.content,
			start1 = to_char(:NEW.start_date, 'YYYY-MM-DD"T"00:00:00.000"Z"'),
			end1 = to_char(:NEW.end_date,'YYYY-MM-DD"T"00:00:00.000"Z"'),
			pm = :NEW.pm,
			manager = :NEW.manager,
			parent = :NEW.parent,
			status = :NEW.status
		WHERE workcode = :OLD.workcode;
END;
-- 삭제 트리거
CREATE OR REPLACE TRIGGER cal_delete
AFTER delete ON wbs
FOR EACH ROW
BEGIN
	DELETE FROM calendar WHERE WORKCODE = :OLD.workcode;
END;

DROP TRIGGER delete_trigger;
DROP TRIGGER cal_insert;
DROP TRIGGER cal_update;
DROP TRIGGER cal_delete;

SELECT a.*, b.name
		FROM calendar a, MEMBER b
		WHERE a.manager = b.id
		AND a.pm = 'happy02';

	UPDATE calendar
	SET status = 95
	WHERE id = 26;
ALTER TABLE calendar RENAME column status1 TO status;
UPDATE calendar
	SET status = '승인요청'
	WHERE id = '13';
UPDATE calendar
	SET parent = 
(SELECT workcode
FROM CALENDAR 
WHERE workcode =
(SELECT DISTINCT parent FROM calendar WHERE manager = 'happy01'))
WHERE manager = 'happy01';
SELECT * FROM CALENDAR;
SELECT DISTINCT pm FROM calendar WHERE manager = 'happy01';
SELECT pm
FROM CALENDAR 
WHERE workcode =
(SELECT DISTINCT parent FROM calendar WHERE manager = 'happy01');
DELETE FROM calendar WHERE id = 27;
SELECT * FROM CALENDAR;
insert into calendar values(cal_seq.nextval, null, '테스트', '테스트테스트',
		'2021-10-24T00:00:00.000Z', '2021-10-27T00:00:00.000Z', 1, '#F44336', '#F44336', '#FFFFFF',
		(SELECT pm
FROM CALENDAR 
WHERE workcode =
(SELECT DISTINCT parent FROM calendar WHERE manager = 'happy01')), 'happy01', (SELECT DISTINCT parent FROM calendar WHERE manager = 'happy01'), 0, null);

SELECT status, count(*) FROM CALENDAR where manager = 'happy01' GROUP BY status;
SELECT * FROM calendar;
SELECT * FROM wbs;
SET sql_safe_updates=1;
SELECT DISTINCT a.*, b.*, c.*
FROM (SELECT count(*) 진행중 FROM calendar WHERE status = '진행중' OR process BETWEEN 1 AND 99) a, (SELECT count(*) 미진행 FROM calendar WHERE status = '승인요청' OR process = 0) b, (SELECT count(*) 종료 FROM calendar WHERE status = '종료됨' OR process = 100) c, calendar d;
SELECT count(CASE WHEN process BETWEEN 1 AND 99 OR status = '진행중' THEN 1 END) FROM calendar;
SELECT b.status, count(status), count(process) FROM calendar a, calendar b WHERE status = '진행중' or process BETWEEN 1 AND 99;
SELECT count(*) 미진행 FROM calendar WHERE status = '승인요청' OR process = 0;
SELECT count(*) 종료 FROM calendar WHERE status = '종료됨' OR process = 100;

SELECT * FROM calendar WHERE status != '종료됨';
SELECT DATEDIFF(DAY, SYSDATE, TO_DATE(end1, 'YYYYMMDD')) AS '차이 일 수'
FROM calendar;
WHERE status != '종료됨';
SELECT end1 FROM calendar;
SELECT REPLACE(SUBSTR(end1,1,10),'-','') FROM calendar;
SELECT TO_DATE(SUBSTR(end1,1,10),'YYYY-MM-DD') AS 날짜
FROM calendar;
SELECT * FROM wbs;
SELECT status FROM calendar WHERE process IS NULL;
(SELECT b.name FROM calendar a, member b WHERE a.pm = b.id);
SELECT a.parent, a.workcode, a.title, c.d_day, a.id, b.cal_name,
				CASE WHEN to_char(a.process) IS NULL THEN a.status
				ELSE to_char(a.process)||'%' END AS cal_process FROM calendar a, 
				(SELECT DISTINCT a.id, CASE WHEN a.manager IS NULL THEN '전체일정'
					ELSE b.name END AS cal_name
					FROM calendar a, MEMBER b
					WHERE a.manager = b.id OR a.manager IS NULL) b,
			(SELECT id, (TO_DATE(SUBSTR(end1,1,10),'YYYY-MM-DD')-TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS d_day FROM calendar) c
		WHERE c.id = a.id AND b.id = a.id
		AND (a.pm = 'happy02' or a.manager = 'happy02')
		AND a.status != '종료됨';
SELECT distinct a.*, b.name FROM calendar a, member b WHERE a.manager = b.id or a.pm = b.id;
 SELECT id, status FROM calendar WHERE status != '종료됨';
SELECT * FROM calendar;
SELECT * FROM MEMBER WHERE id = 'happy02';
SELECT 
SELECT (TO_DATE(SUBSTR(end1,1,10),'YYYY-MM-DD')-TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS d_day FROM calendar;
SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) AS 날짜 FROM calendar;


SELECT title FROM calendar
		WHERE pm = 'happy02'
		AND parent IS NULL;
SELECT * FROM calendar;
SELECT * FROM wbs;
SELECT workcode, title FROM calendar WHERE workcode IN (SELECT DISTINCT parent FROM calendar WHERE manager = 'happy02' OR pm = 'happy02');
INSERT INTO calendar(start1) values('2021-10-29'||'T'||'09'||':'||'09'||':00.000Z');

SELECT DISTINCT a.id, CASE WHEN a.manager IS NULL THEN '전체일정'
					ELSE b.name END AS cal_name
		FROM calendar a, MEMBER b
		WHERE a.manager = b.id OR a.manager IS NULL;
SELECT DISTINCT a.id, b.name FROM calendar a, MEMBER b 
WHERE a.manager = b.id 
OR a.manager IS null;
SELECT * FROM calendar WHERE (parent = 2 OR workcode = 13) AND (pm = 'happy11' OR manager = 'happy11');
SELECT * FROM calendar;
SELECT
TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) - TO_DATE('19930315')
FROM
DUAL; 
SELECT status, count(*) cnt 
		FROM CALENDAR
		WHERE (parent = 2 OR workcode = 2) 
		AND (pm = 'happy02' OR manager = 'happy02')
GROUP BY status;
SELECT count(*) FROM calendar
WHERE manager = 'happy02' OR pm = 'happy02'
AND (parent = 2 OR workcode = 2);

SELECT SUBSTR(start1, 1, 10) start1 FROM calendar WHERE workcode = 3;
SELECT DISTINCT parent FROM calendar WHERE manager = 'happy01';
SELECT pm
		FROM CALENDAR 
		WHERE workcode = 2;