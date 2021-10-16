CREATE SEQUENCE s_project_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000;

CREATE TABLE small_project(
	spcode NUMBER,
	pcode NUMBER,
	startdate DATE,
	enddate DATE,
	maxheadcnt NUMBER,
	explanation VARCHAR2(500),
	dept VARCHAR(50),
	CONSTRAINT small_project_pk PRIMARY KEY(spcode)
);

CREATE TABLE project_bookmark(
	bmcode varchar2(100),
	pcode NUMBER,
	id varchar(50),
	CONSTRAINT bmcode_pk PRIMARY KEY(bmcode)
)

 
SELECT count(*) projectcnt FROM project_dept
WHERE dept = '개발1';
SELECT count(*) taskcnt FROM wbs
WHERE MANAGER = '조승호'
AND status = '진행중';

SELECT count(*) cnt FROM wbs w, workfile wf
WHERE manager = '김재성'
AND w.workcode = wf.workcode
AND status = '진행중';

SELECT * FROM PROJECT_BOOKMARK;
SELECT * FROM project;
SELECT p.pcode, pd.DEPT, p.ID, m.dept, p.status FROM project p, PROJECT_DEPT pd, MEMBER m
WHERE p.pcode = pd.pcode
AND p.id = m.id;
SELECT * FROM PROJECT_DEPT;
SELECT * FROM tab;
SELECT * FROM MEMBER;
SELECT * FROM risk;
SELECT * FROM works;
SELECT * FROM WORKFILE;
SELECT * FROM WBS;

SELECT count(*) cnt FROM project p,
			(	SELECT pcode FROM project_dept
				WHERE dept = '개발1'
			) d
		WHERE p.pcode = d.pcode
		AND NOT status = '종료됨';
SELECT * FROM MEMBER WHERE id='happy01';
SELECT * FROM project_dept WHERE dept = '개발1';
SELECT * FROM project;
SELECT * FROM project_dept;
SELECT count(*) cnt FROM project p, project_dept d
WHERE p.pcode = d.pcode
AND dept = '개발1'
AND NOT status = '종료됨';
	
SELECT p.pcode, p.pname, p.id, m.name, p.status, 
	TO_CHAR(p.startdate,'YYYY-MM-DD') startdate,
	TO_CHAR(p.enddate,'YYYY-MM-DD') enddate
FROM project p, MEMBER m,
	(	SELECT pcode FROM project_bookmark
		WHERE id = 'happy02'
	) b
WHERE p.pcode = b.pcode
AND p.id = m.id;

SELECT count(*) cnt FROM project p, project_dept pd
		WHERE p.pcode = pd.pcode
		AND pd.dept = '디자인1팀'
		AND NOT p.status = '종료됨';
SELECT * FROM project p, PROJECT_DEPT pd 
WHERE p.pcode = pd.PCODE  
AND pd.dept = '디자인1팀'
AND NOT p.status = '종료됨';

SELECT * FROM PROJECT_DEPT pd, MEMBER m
WHERE pd.DEPT = m.dept;