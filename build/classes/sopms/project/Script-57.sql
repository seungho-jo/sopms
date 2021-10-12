CREATE SEQUENCE proejct_seq
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 9999999;

CREATE TABLE project_dept(
	pcode NUMBER PRIMARY key,
	dept varchar2(50)
);
INSERT INTO PROJECT_DEPT VALUES(1,'개발1팀');
CREATE TABLE project(
	pcode NUMBER PRIMARY key,
	pname varchar2(70) NOT NULL,
	name varchar2(50) NOT NULL,
	startdate date,
	enddate date,
	teamnum number NOT NULL,
	explanation varchar2(1000)
);
INSERT INTO project values(proejct_seq.nextval,'프로젝트1','홍길동','2021-09-01','2021-10-31',5,'테스트');

SELECT * FROM project;
SELECT * FROM PROJECT_DEPT;
