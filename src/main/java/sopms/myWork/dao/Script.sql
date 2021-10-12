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