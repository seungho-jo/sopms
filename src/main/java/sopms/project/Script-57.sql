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
SELECT * FROM PROJECT_dept;

프로젝트 상태 컬럼 : 진행중 / 몇개는 종료된걸로
name = id 
SET id;

SELECT p.pcode, pname, id, teamnum, TO_CHAR(startdate,'YYYY-MM-DD') as startdate, TO_CHAR(enddate,'YYYY-MM-DD') as enddate, 
 	 	status, explanation, b.dept
FROM project p, 
	(SELECT pcode, LISTAGG(dept,',') WITHIN GROUP(ORDER BY dept) AS dept FROM PROJECT_DEPT GROUP BY pcode) b
WHERE p.PCODE = b.PCODE(+)
AND p.PCODE = 8;


SELECT LISTAGG(dept,',') WITHIN GROUP(ORDER BY dept) AS dept FROM PROJECT_DEPT GROUP BY pcode;
DROP TABLE board;

CREATE SEQUENCE board_seq
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 9999999;
--커뮤니티게시판
CREATE TABLE board(
	bcode NUMBER PRIMARY key,
	btitle varchar2(70) NOT NULL,
	name varchar2(60),
	bcontent varchar2(4000),
	readcnt NUMBER,
	regdte date
);
INSERT INTO board VALUES (board_seq.nextval,#{btitle},#{name},#{bcontent},#{readcnt},#{regdte});
INSERT INTO board VALUES (board_seq.nextval,'테스트','홍길동','안녕',30,sysdate);
INSERT INTO board VALUES (board_seq.nextval,'안녕하세요','김길동','안녕',30,sysdate);
SELECT * FROM board;
SELECT *
		FROM (
		SELECT rownum cnt, b.*
		FROM BOARD b
		WHERE btitle LIKE '%'||''||'%'
		AND name LIKE '%'||''||'%'
		ORDER BY bcode DESC)
		WHERE cnt BETWEEN 1 AND 5;
	
		SELECT count(*)
		FROM BOARD b
		WHERE btitle LIKE '%'||''||'%'
		AND name LIKE '%'||''||'%';
		
	SELECT bcode, btitle, name, bcontent, readcnt, TO_CHAR(REGDTE ,'YYYY-MM-DD HH:MM') as REGDTE
	FROM board
	WHERE bcode =1;