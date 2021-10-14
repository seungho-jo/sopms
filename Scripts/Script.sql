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
	bmcode NUMBER,
	pcode NUMBER,
	id varchar(50),
	CONSTRAINT bmcode_pk PRIMARY KEY(bmcode)
)

DROP TABLE small_project;
SELECT * FROM project;
SELECT * FROM PROJECT_DEPT;
SELECT * FROM tab;
SELECT * FROM MEMBER;
