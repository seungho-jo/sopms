CREATE SEQUENCE project_seq
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 9999999;

CREATE TABLE project_dept(
	pcode NUMBER,
	dept varchar2(50)
);
INSERT INTO PROJECT_DEPT VALUES(1,'개발1팀');
CREATE TABLE project(
	pcode NUMBER PRIMARY key,
	pname varchar2(70) NOT NULL,
	id varchar2(60) NOT NULL,
	startdate date,
	enddate date,
	teamnum number NOT NULL,
	status varchar2(70) DEFAULT '진행중',
	explanation varchar2(2000)
);
INSERT INTO project values(1,'프로젝트1','happy01','2021-09-01','2021-10-31',5,'진행중','테스트');
	
insert into project_dept values(project_seq.currval,#{dept});
SELECT * FROM project;

SELECT * FROM MEMBER;
SELECT * FROM PROJECT;

프로젝트 상태 컬럼 : 진행중 / 몇개는 종료된걸로
name = id 
SET id

		 
SELECT p.pcode, p.pname, d.dept, p.id, p.teamnum, TO_CHAR(startdate,'YYYY-MM-DD') AS startdate, TO_CHAR(enddate,'YYYY-MM-DD') AS enddate, 
status, explanation
FROM project p, project_dept d
where pcode = 2;