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
SELECT * FROM board;

SELECT bcode, btitle, id, name, readcnt,
	CASE	WHEN TRUNC(SYSDATE,'DD')=TRUNC(regdte,'DD') THEN TO_CHAR(regdte,'HH24:MI')
			ELSE TO_CHAR(regdte,'fmMM-DD')
	END AS regdte
FROM (
	SELECT rownum rnum, b.bcode, b.btitle, b.id, m.name, b.readcnt, b.regdte 
	FROM board b, MEMBER m
	WHERE b.id = m.id
	ORDER BY regdte DESC
) a;

WHERE rnum <= 5;
SELECT * FROM (
	SELECT rownum rnum, bcode, btitle, id, name, readcnt, dept, RANK, 
		CASE	WHEN TRUNC(SYSDATE,'DD')=TRUNC(regdte,'DD') THEN TO_CHAR(regdte,'HH24:MI')
				ELSE TO_CHAR(regdte,'fmMM-DD')
		END AS regdte
	FROM(
		SELECT b.*, m.name, m.dept, m.rank
		FROM board b, MEMBER m
		WHERE b.id = m.id
		ORDER BY regdte DESC
	)
)
WHERE rnum <=5 ;
SELECT *
FROM board b, MEMBER m
WHERE b.id = m.id
ORDER BY regdte DESC;

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

SELECT risk_status FROM RISK r, PROJECT p
WHERE r.PCODE = p.PCODE
AND r.id = 'happy01'
AND NOT p.status = '종료됨';

SELECT * FROM RISK r, PROJECT p, MEMBER m
WHERE r.PCODE = p.PCODE
AND r.id = m.id
AND m.dept = '개발1팀'
AND NOT p.status = '종료됨';--x

SELECT * FROM RISK r , PROJECT p , PROJECT_DEPT pd 
WHERE r.pcode = p.PCODE 
AND p.pcode = pd.PCODE 
AND pd.DEPT = '개발1팀'
AND NOT p.status='종료됨';--o

SELECT *  FROM risk r, member m
WHERE r.id = m.id
AND m.dept = '개발2팀'
AND NOT risk_status = '조치완료';--x

SELECT *  FROM risk r, PROJECT_DEPT pd
WHERE r.pcode = pd.pcode
AND pd.dept = '개발2팀'
AND NOT RISK_STATUS = '조치완료';--o

SELECT risk_status, count(*) cnt FROM RISK r , PROJECT p , PROJECT_DEPT pd 
WHERE r.pcode = pd.PCODE 
AND r.PCODE = p.PCODE 
AND pd.DEPT = '개발1팀'
AND NOT p.STATUS = '종료됨'
GROUP BY r.risk_status;

SELECT risk_status, count(*) cnt FROM risk r
WHERE id = 'happy02'
GROUP BY risk_status;

SELECT TO_CHAR(risk_reg,'fmMM') month, count(*) count FROM risk
WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND TRUNC(SYSDATE,'MM')
AND id = 'happy01'
GROUP BY TO_CHAR(risk_reg,'fmMM');

SELECT TO_CHAR(risk_reg,'fmMM') month, count(*) count FROM RISK r , PROJECT_DEPT pd 
WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND TRUNC(SYSDATE,'MM')
AND r.pcode = pd.pcode
AND pd.dept = '개발1팀'
GROUP BY TO_CHAR(risk_reg,'fmMM');

SELECT * FROM RISK r , PROJECT_DEPT pd 
WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND TRUNC(SYSDATE,'MM')
AND r.pcode = pd.PCODE 
AND pd.DEPT ='개발1팀';

SELECT TO_CHAR(b.dt, 'YYYY-MM') AS risk_reg
     , NVL(SUM(a.cnt), 0) cnt
FROM(	SELECT TRUNC(risk_reg,'DD') risk_reg, count(*) cnt FROM risk
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND ADD_MONTHS(TRUNC(SYSDATE,'MM'),1)
		AND id = 'happy01'
		GROUP BY TRUNC(risk_reg,'DD')
	) a,
	(	SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
		FROM dual 
		CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),0) 
							- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + 1)
	) b
WHERE b.dt = a.risk_reg(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM');

SELECT TO_CHAR(b.dt, 'YYYY-MM') AS risk_reg
     , NVL(SUM(a.cnt), 0) cnt
FROM(	SELECT TRUNC(risk_reg,'DD') risk_reg, count(*) cnt FROM risk r, project_dept pd
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND ADD_MONTHS(TRUNC(SYSDATE,'MM'),1)
		AND r.pcode = pd.pcode
		AND pd.dept = '개발2팀'
		GROUP BY TRUNC(risk_reg,'DD')
	) a,
	(	SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
		FROM dual 
		CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),0) 
							- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + 1)
	) b
WHERE b.dt = a.risk_reg(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM');

SELECT TO_CHAR(b.dt, 'YYYY-MM-DD') AS risk_reg
     , NVL(SUM(a.cnt), 0) cnt
FROM(	SELECT TRUNC(risk_reg,'DD') risk_reg, count(*) cnt FROM risk r, project_dept pd
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND ADD_MONTHS(TRUNC(SYSDATE,'MM'),1)
		AND r.pcode = pd.pcode
		AND pd.dept = '개발1팀'
		GROUP BY TRUNC(risk_reg,'DD')
	) a,
	(	SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
		FROM dual 
		CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),0) 
							- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + 1)
	) b
WHERE b.dt = a.risk_reg(+)
GROUP BY b.dt
ORDER BY b.dt;

SELECT risk_reg, count(*) cnt FROM risk r, project_dept pd
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND TRUNC(SYSDATE,'MM')
		AND r.pcode = pd.pcode
		AND pd.dept = '개발1팀'
		GROUP BY risk_reg;
SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
FROM dual 
CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),0) 
					- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + 1);
					
SELECT p.pcode, p.pname, m.name AS pmName, ( TRUNC(p.enddate,'DD') - TRUNC(sysdate,'DD') ) AS status,
			TO_CHAR(p.startdate,'YYYY-MM-DD') startdate, TO_CHAR(p.enddate,'YYYY-MM-DD') enddate, NVL(pb.bmcode,' ') AS explanation
FROM project p, project_dept pd, member m,
	(select pcode, bmcode from project_bookmark where id = 'happy01' ) pb
WHERE p.pcode = pd.pcode
AND p.id = m.id
AND pd.dept = '개발1팀'
AND NOT p.status = '종료됨'
AND p.pcode = pb.pcode(+);
		
SELECT p.pcode, p.pname, m.name AS pmName, ( TRUNC(p.enddate,'DD') - TRUNC(sysdate,'DD') ) AS status,
			TO_CHAR(p.startdate,'YYYY-MM-DD') startdate, TO_CHAR(p.enddate,'YYYY-MM-DD') enddate, NVL(pb.bmcode,' ') AS explanation
FROM project p, project_dept pd, member m, project_bookmark pb
WHERE p.pcode = pd.pcode
AND p.id = m.id
AND pd.dept = '개발1팀'
AND NOT p.status = '종료됨'
AND p.pcode = pb.pcode(+)
AND pb.id = 'happy01';

SELECT status, count(*) cnt 
		FROM CALENDAR
		WHERE manager = 'happy01'
		GROUP BY status;
SELECT status, count(*) cnt 
FROM CALENDAR
WHERE manager = 'happy01'
GROUP BY status;

CREATE TABLE test_parent1 (
	code NUMBER,
	name varchar2(100),
	CONSTRAINT test_parent_pk1 PRIMARY KEY(code)
);
CREATE TABLE test_parent2 (
	code NUMBER,
	name varchar2(100),
	CONSTRAINT test_parent_pk2 PRIMARY KEY(code)
);
CREATE TABLE test_children(
	code NUMBER,
	parent NUMBER,
	name varchar2(100),
	CONSTRAINT test_children_pk PRIMARY KEY (code)
);
ALTER TABLE TEST_CHILDREN ADD CONSTRAINT test_children_fk1 FOREIGN KEY (parent) REFERENCES test_parent1(code)
ON DELETE CASCADE;
ALTER TABLE TEST_CHILDREN ADD CONSTRAINT test_children_fk2 FOREIGN KEY (parent) REFERENCES test_parent2(code);
SELECT * FROM TEST_PARENT1;
SELECT * FROM TEST_PARENT2;
SELECT * FROM TEST_children;

DROP TABLE TEST_PARENT1;
DROP TABLE TEST_PARENT2;
DROP TABLE TEST_CHILDREN;
DELETE FROM TEST_PARENT1 WHERE code = 1;

INSERT INTO TEST_PARENT1 VALUES  ( 1, '1부모1');
INSERT INTO TEST_PARENT1 VALUES  ( 2, '1부모2');

INSERT INTO TEST_PARENT2 VALUES ( 2, '2부모1');
INSERT INTO TEST_CHILDREN VALUES ( 3, 1, '1자식1');
INSERT INTO TEST_CHILDREN VALUES ( 4, 1, '1자식2');
INSERT INTO TEST_CHILDREN VALUES ( 5, 2, '1자식3');
SELECT * FROM (
	SELECT rownum rnum, a.* FROM (
		SELECT * FROM risk
		WHERE (
			RISK_NAME LIKE '%'||'에러'||'%'
			OR RISK_CONTENT LIKE '%'||'에러'||'%'
		)
		AND id='happy02'
		ORDER BY RISK_REG DESC
	) a
)
WHERE rnum BETWEEN 1 AND 20;

SELECT p.pname FROM project p, lesource l
WHERE p.pcode = l.pcode
AND l.id = 'happy01'
AND NOT p.status = '종료됨';

SELECT p.pcode, p.pname, p.id AS pmId, m.name AS pmName, ( TRUNC(p.enddate,'DD') - TRUNC(sysdate,'DD') ) AS status,
	TO_CHAR(p.startdate,'YYYY-MM-DD') startdate, TO_CHAR(p.enddate,'YYYY-MM-DD') enddate, NVL(pb.bmcode,' ') AS explanation
FROM project p, project_dept pd, member m,
	(	SELECT pcode, bmcode FROM project_bookmark
		WHERE id = #{id} ) pb
WHERE p.pcode = pd.pcode
AND p.id = m.id
AND pd.dept = '개발1팀'
AND NOT p.status = '종료됨'
AND p.pcode = pb.pcode(+)
ORDER BY p.pname;

SELECT p.pcode, p.pname, p.id AS pmId, m.name AS pmName, ( TRUNC(p.enddate,'DD') - TRUNC(sysdate,'DD') ) AS status,
	TO_CHAR(p.startdate,'YYYY-MM-DD') startdate, TO_CHAR(p.enddate,'YYYY-MM-DD') enddate, NVL(pb.bmcode,' ') AS explanation
FROM PROJECT p , LESOURCE l , member m ,
	(	SELECT pcode, bmcode FROM project_bookmark 
		WHERE id='happy01') pb
WHERE p.id = m.id
AND p.pcode = l.pcode 
AND l.id = 'happy01'
AND NOT p.status = '종료됨'
AND p.pcode = pb.pcode(+)
ORDER BY p.pname;

SELECT p.pcode, p.pname, p.id AS pmId, m.name AS pmName, ( TRUNC(p.enddate,'DD') - TRUNC(sysdate,'DD') ) AS status,
	TO_CHAR(p.startdate,'YYYY-MM-DD') startdate, TO_CHAR(p.enddate,'YYYY-MM-DD') enddate, NVL(pb.bmcode,' ') AS explanation
FROM PROJECT p , LESOURCE l , member m ,
	(	SELECT pcode, bmcode FROM project_bookmark 
		WHERE id='happy01') pb
WHERE p.id = m.id
AND p.pcode = l.pcode 
AND l.id = 'happy01'
AND NOT p.status = '종료됨'
AND p.pcode = pb.pcode(+)
ORDER BY p.pname;
SELECT * FROM LESOURCE l ;

SELECT TO_CHAR(b.dt, 'YYYY-MM') month
     , NVL(SUM(a.cnt), 0) count
FROM(	SELECT TRUNC(risk_reg,'DD') risk_reg, count(*) cnt FROM risk r, lesource l
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND ADD_MONTHS(TRUNC(SYSDATE,'MM'),1)
		AND r.pcode = l.pcode
		AND l.id = 'happy02'
		GROUP BY TRUNC(risk_reg,'DD')
	) a,
	(	SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
		FROM dual 
		CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),1) 
							- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6))
	) b
WHERE b.dt = a.risk_reg(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM');

SELECT TO_CHAR(b.dt, 'YYYY-MM') month
     , NVL(SUM(a.cnt), 0) count
FROM(	SELECT TRUNC(risk_reg,'DD') risk_reg, count(*) cnt FROM risk r
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND ADD_MONTHS(TRUNC(SYSDATE,'MM'),1)
		AND r.id = 'happy02'
		GROUP BY TRUNC(risk_reg,'DD')
	) a,
	(	SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
		FROM dual 
		CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),1) 
							- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6))
	) b
WHERE b.dt = a.risk_reg(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM');

SELECT * FROM risk;


SELECT TO_CHAR(b.dt, 'YYYY-MM') month
     , NVL(SUM(a.cnt), 0) count
FROM(	SELECT TRUNC(risk_reg,'DD') risk_reg, count(*) cnt FROM risk r, lesource l
		WHERE risk_reg BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) AND ADD_MONTHS(TRUNC(SYSDATE,'MM'),1)
		AND r.pcode = l.pcode
		AND l.id = 'happy02'
		GROUP BY TRUNC(risk_reg,'DD')
	) a,
	(	SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6) + LEVEL - 1 AS dt
		FROM dual 
		CONNECT BY LEVEL <= (ADD_MONTHS(TRUNC(SYSDATE,'MM'),1) 
							- ADD_MONTHS(TRUNC(SYSDATE,'MM'),-6))
	) b
WHERE b.dt = a.risk_reg(+)
GROUP BY TO_CHAR(b.dt, 'YYYY-MM')
ORDER BY TO_CHAR(b.dt, 'YYYY-MM')