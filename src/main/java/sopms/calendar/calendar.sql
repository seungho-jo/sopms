CREATE TABLE calendar(
id number primary KEY, -- 일정id
workcode NUMBER NOT null, -- 프로젝트id
title varchar2(100) NOT null, -- 일정명
content varchar2(1000),  -- 일정내용
start1 DATE NOT null,  -- 시작일
end1 DATE NOT null,  -- 종료일
allDay number(1),  -- 종일여부 1=종일, 0=시간별
Color varchar2(50) NOT null, -- 일정배경색
pmcolor varchar2(50) DEFAULT 'purple', -- pm기준 매니저별 일정배경색
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

DROP TABLE calendar;
SELECT * FROM wbs;
SELECT * FROM small_project;