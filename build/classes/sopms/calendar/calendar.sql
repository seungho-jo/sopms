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
manager varchar2(60) NOT NULL, -- 일정 등록자명
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
SELECT * FROM wbs;
SELECT * FROM calendar;
SELECT * FROM "MEMBER";
SELECT w.workcode, c.manager
FROM wbs w
INNER JOIN calendar c
on c.manager = w.manager;
SELECT b.WORKCODE, a.WORKCODE
FROM calendar a
right OUTER JOIN wbs b
ON a.MANAGER = b.MANAGER;
WHERE MANAGER = '조승호';
SELECT id, workcode,
			title, content,
			TO_char(start1, 'YYYY-MM-DD"T"HH24:MI:SS') start1, 
			TO_char(end1, 'YYYY-MM-DD"T"HH24:MI:SS') end1, 
			ALLDAY, 
			COLOR,
			pmcolor,
			manager,
			process 
		FROM calendar
		where manager = '조승호';
	DROP TABLE calendar;
insert into calendar values( cal_seq.nextval, '2', 'DB설계','DB',
		'2021-10-03T15:00:00', '2021-10-04T15:00:00',0,'#0099cc','조승호',20);
UPDATE calendar
				SET title = '시도2',
					content = '시도도',
					start1 = '2021-10-03T15:00:00.000Z',
					end1 = '2021-10-03T18:00:00.000Z',
					allday = '0',
					bordercolor = '#0099cc',
					backgroundcolor = '#0099cc',
					textcolor = '#ccffff',
					process = '22'
WHERE id = 1;
SELECT * FROM wbs;
SELECT * FROM calendar;
SELECT a.*, b.name
FROM calendar a, MEMBER b
WHERE a.MANAGER = b.id
AND a.MANAGER = 'happy01';
-- 삽입 트리거
CREATE OR REPLACE TRIGGER cal_insert
AFTER INSERT ON wbs
FOR EACH ROW
BEGIN
	INSERT INTO calendar VALUES 
	(cal_seq.nextval, :NEW.workcode, :NEW.title, :NEW.content, :NEW.start_date, :NEW.end_date, 
	1, '#6633FF', '#6633FF', '#FFFFFF', :NEW.manager, NULL);
END;
-- 업데이트 트리거
CREATE OR REPLACE TRIGGER cal_update
AFTER update ON wbs
FOR EACH ROW
BEGIN
	UPDATE calendar 
		SET workcode = :NEW.workcode,
			title = :NEW.title,
			content = :NEW.content,
			start_date = :NEW.start_date,
			end_date = :NEW.end_date
		WHERE workcode = :OLD.workcode;
END;
-- 삭제 트리거
CREATE OR REPLACE TRIGGER cal_delete
AFTER delete ON wbs
FOR EACH ROW
BEGIN
	DELETE FROM calendar WHERE WORKCODE = :OLD.workcode;
END;