CREATE TABLE Risk (
	risk_no VARCHAR2(15) PRIMARY KEY, /* 리스크번호 */
	risk_name VARCHAR2(50), /* 리스크명 */
	risk_content VARCHAR2(1000), /* 리스크내용 */
	risk_reg DATE, /* 리스크 등록일 */
	risk_upt DATE, /* 리스크 수정일 */
	risk_status NUMBER, /* 리스크 상태 */
	risk_cnt NUMBER, /* 리스크 조회수 */
	id VARCHAR2(60)
);

SELECT * FROM risk;

/*
 CREATE TABLE Risk (
	risk_no VARCHAR2(15) PRIMARY KEY, 
	risk_name VARCHAR2(50), 
	risk_content VARCHAR2(1000), 
	risk_reg DATE, 
	risk_upt DATE, 
	risk_status NUMBER, 
	risk_cnt NUMBER, 
	id VARCHAR2(60)
);  */
/* 리스크 생성*/
INSERT INTO risk VALUES (seq_risk_no.currval,'요구사항 정의서 누락','요구사항정의서누락되었습니다. 확인부탁드려요',
	to_date('2021-09-28 19:00:25','YYYY-MM-DD HH24:MI:SS'),null,1,0,'happy01');
INSERT INTO risk VALUES (seq_risk_no.nextval,'리스크화면 타이틀 수정요망','리스크 타이틀을 기본 텍스트와 구분하는 작업이 필요합니다.',
	to_date('2021-09-29 13:15:02','YYYY-MM-DD HH24:MI:SS'),null,1,0,'happy04');
INSERT INTO risk VALUES (seq_risk_no.nextval,'프로젝트 상세페이지 404에러 발생','프로젝트 리스트에서 상세페이지로 들어갈 때 오류뜹니다 확인해주세요.',
	to_date('2021-09-27 09:10:35','YYYY-MM-DD HH24:MI:SS'),null,2,0,'happy07');
INSERT INTO risk VALUES (seq_risk_no.nextval,'리스크 상세페이지 수정 중입니다.','리스크 상세페이지 수정 중입니다.',
	to_date('2021-09-27 11:33:10','YYYY-MM-DD HH24:MI:SS'),null,2,0,'happy07');
INSERT INTO risk VALUES (seq_risk_no.nextval,'요구사항 정의서 누락','요구사항 정의서 누락되었습니다. 확인부탁드려요.',
	to_date('2021-09-28 10:10:35','YYYY-MM-DD HH24:MI:SS'),null,1,0,'happy02');
INSERT INTO risk VALUES (seq_risk_no.nextval,'관리자 권한설정 문제','관리자 권한설정 재수정 바랍니다.',
	to_date('2021-09-28 14:10:35','YYYY-MM-DD HH24:MI:SS'),null,1,0,'happy03');
INSERT INTO risk VALUES (seq_risk_no.nextval,'요구사항 정의서 누락','요구사항 정의서 누락되었습니다. 확인부탁드려요.',
	to_date('2021-09-28 10:10:35','YYYY-MM-DD HH24:MI:SS'),null,3,0,'happy05');
INSERT INTO risk VALUES (seq_risk_no.nextval,'일정 상세페이지 404 에러 발생','일정 상세페이지 들어가서 작업중에 404에러 발생했습니다. 수정중입니다.',
	to_date('2021-09-30 10:20:35','YYYY-MM-DD HH24:MI:SS'),null,3,0,'happy06');
INSERT INTO risk VALUES (seq_risk_no.nextval,'요구사항 정의서 누락','요구사항 정의서 누락되었습니다. 확인부탁드려요.',
	to_date('2021-10-01 10:10:35','YYYY-MM-DD HH24:MI:SS'),null,3,0,'happy09');
INSERT INTO risk VALUES (seq_risk_no.nextval,'보고서 누락','보고서 누락되었습니다.',
	to_date('2021-10-03 10:10:35','YYYY-MM-DD HH24:MI:SS'),null,2,0,'happy10');
INSERT INTO risk VALUES (seq_risk_no.nextval,'보고서 누락','보고서 누락되었습니다.',
	to_date('2021-10-03 10:10:35','YYYY-MM-DD HH24:MI:SS'),null,2,0,'happy11');



/* 리스크 프로젝트 코드 열 삽입*/
ALTER TABLE risk ADD pcode NUMBER;

/*리스크 프로젝트 코드 제약조건*/
ALTER TABLE risk ADD 
	CONSTRAINT risk_to_project
	FOREIGN KEY (pcode) 
	REFERENCES project (pcode);

/* 리스크 프로젝트 코드 삽입 */
UPDATE risk SET pcode = 2 WHERE risk_no = 1;
UPDATE risk SET pcode = 3 WHERE risk_no = 2;
UPDATE risk SET pcode= 4 WHERE risk_no = 3;
UPDATE risk SET pcode = 5 WHERE risk_no = 4;
UPDATE risk SET pcode = 6 WHERE risk_no = 5;
UPDATE risk SET pcode = 7 WHERE risk_no = 6;
UPDATE risk SET pcode = 8 WHERE risk_no = 7;
UPDATE risk SET pcode = 9 WHERE risk_no = 8;
UPDATE risk SET pcode = 10 WHERE risk_no = 9;
UPDATE risk SET pcode = 11 WHERE risk_no = 10;
UPDATE risk SET pcode = 12 WHERE risk_no = 11;




/*
 ALTER TABLE MY_SCHEMA.Risk_Response
	ADD
		CONSTRAINT FK_Risk_TO_Risk_Response
		FOREIGN KEY (
			risk_no
		)
		REFERENCES MY_SCHEMA.Risk (
			risk_no
		);
 */
/* 제약조건으로 foreign key 추가 member id => risk id*/
ALTER TABLE risk 
	ADD
		CONSTRAINTS risk_to_risk_Risk_Response
		FOREIGN key(id)
		REFERENCES MEMBER (id);

ALTER TABLE RISK 
	RENAME CONSTRAINTS risk_to_risk_Risk_Response TO risk_to_member;
	



/*  시퀀스 형식
create sequence 시퀀스명
		increment by 증가단위
		start with 시작번호
		maxvalue 최대값 | nomaxvalue
		minvalue 최소값 | nominvalue
		cycle | nocycle -- 반복여부  설정.
		cache n | nocache -- 속도 개선을 위해 메모리 캐시 시퀀스 수 
 */

CREATE SEQUENCE seq_risk_no
	INCREMENT BY 1
	START WITH 1
	minvalue 1
	MAXVALUE 9999;

ALTER SEQUENCE seq_risk_no
INCREMENT BY 1;

SELECT seq_risk_no.nextval
FROM dual;


SELECT seq_risk_no.currval
FROM dual;

INSERT INTO Risk (risk_no, risk_name, risk_content, risk_status, risk_reg) 
			VALUES (seq_risk_no.nextval, '리스크테스트', '리스크 테스트중입니다.', 1, sysdate); 
		
SELECT * FROM risk;
DELETE FROM risk WHERE risk_no =12;


	select risk_no, risk_name, id, risk_status, risk_reg
			from risk
			where risk_name like '%'||'보고서'||'%'
			and id like '%'||''||'%';
			
/* 리스크 상태 데이터유형 변경*/
ALTER TABLE risk DROP column risk_status;

ALTER TABLE risk modify risk_status varchar2(20);

UPDATE risk SET risk_status = '진행중' WHERE risk_no = 1;
UPDATE risk SET risk_status = '진행중' WHERE risk_no = 2;
UPDATE risk SET risk_status = '조치완료' WHERE risk_no = 3;
UPDATE risk SET risk_status = '조치완료' WHERE risk_no = 4;
UPDATE risk SET risk_status = '진행중' WHERE risk_no = 5;
UPDATE risk SET risk_status = '진행중' WHERE risk_no = 6;
UPDATE risk SET risk_status = '홀드' WHERE risk_no = 7;
UPDATE risk SET risk_status = '홀드' WHERE risk_no = 8;
UPDATE risk SET risk_status = '홀드' WHERE risk_no = 9;
UPDATE risk SET risk_status = '조치완료' WHERE risk_no = 10;
UPDATE risk SET risk_status = '조치완료' WHERE risk_no = 11;

SELECT pname 
FROM project;

INSERT INTO Risk (risk_no, risk_name, risk_content, risk_reg, id, pcode, risk_status) 
			VALUES (seq_risk_no.nextval, 'risk_name', 'risk_content_add', sysdate, 'happy02', 3, '진행중'); 
			
SELECT * FROM risk;
DELETE FROM risk WHERE risk_no = 12;

SELECT a.*, b.pname FROM risk a, project b
WHERE a.pcode = b.pcode
AND a.risk_no = 4;

select * 
		from(
			select rownum as no, risk_name, id, risk_status, risk_reg, risk_no
			from risk
			where risk_name like '%'||''||'%'
			and id like '%'||''||'%'
		)
		where no between 1 and 10
		order by risk_reg DESC;

delete from risk
		where risk_no = 16;
		
	
update risk
			set id = 'happy02',
				risk_content = 'test',
				risk_status ='조치완료'
			where risk_no = 14;
		
/* 리스크 조치 테이블 */
CREATE TABLE riskJochi(
	risk_no VARCHAR2(15),
	id  VARCHAR2(60),
	risk_jochiCont VARCHAR2(1000),
	risk_jochiUpt DATE,
	CONSTRAINT fk_risk_no FOREIGN KEY (risk_no) REFERENCES risk(risk_no)
);
SELECT * FROM risk;
SELECT * FROM riskJochi;
DELETE from riskJochi;
SELECT b.pcode, b.dept, m.*
FROM project_dept b, MEMBER m
WHERE b.dept = m.dept
AND id NOT IN (SELECT id FROM lesource WHERE pcode = 2);

INSERT INTO RISKJOCHI (risk_no, id, RISK_JOCHICONT, RISK_JOCHIUPT)
SELECT RISK_NO, id, risk_content, sysdate FROM risk
WHERE risk_no = 14;

SELECT * FROM risk WHERE risk_no = 3;

SELECT a.risk_no, a.id, a.risk_jochiCont, a.risk_jochiUpt
FROM riskJochi a, risk b
WHERE a.risk_no = b.risk_no
AND b.risk_no = 14;

MERGE INTO RISKJOCHI a
USING dual
ON (a.risk_no = 14)
WHEN MATCHED THEN 
UPDATE SET 
		a.id = 'happy02',
		a.RISK_JOCHICONT = 'testing',
		a.RISK_JOCHIUPT = sysdate
WHEN NOT MATCHED THEN 
INSERT (a.risk_no, a.id, a.RISK_JOCHICONT, a.RISK_JOCHIUPT) 
VALUES (14,'happy02','testing',sysdate);

ALTER TABLE riskJochi ADD pname varchar2(70);

select rownum as no, r.risk_name, r.risk_content, r.id, r.risk_reg
		from risk r, member m 
		where r.id = m.id
		and pcode = 2;

SELECT * FROM risk;
ALTER TABLE risk ADD RANK varchar2(50);

UPDATE risk SET jochiperson = 'happy07' WHERE id= 'happy' AND risk_no = 4;
UPDATE risk SET jochiperson = 'happy01' WHERE id = 'happy01' AND risk_no = 1;
UPDATE risk SET jochiperson = 'happy07' WHERE id = 'happy07' AND risk_no = 3;
UPDATE risk SET jochiperson = 'happy07' WHERE id = 'happy07' AND risk_no = 4;
UPDATE risk SET jochiperson = 'happy06' WHERE id = 'happy06' AND risk_no = 8;
UPDATE risk SET jochiperson = 'happy09' WHERE id = 'happy09' AND risk_no = 9;
UPDATE risk SET jochiperson = 'happy10' WHERE id = 'happy10' AND risk_no = 10;
UPDATE risk SET jochiperson = 'happy11' WHERE id = 'happy11' AND risk_no = 11;

UPDATE risk SET RANK = '부장' WHERE id = 'happy02';
UPDATE risk SET RANK = '차장' WHERE id = 'happy01';
UPDATE risk SET RANK = '주임' WHERE id = 'happy07';
UPDATE risk SET RANK = '주임' WHERE id = 'happy06';
UPDATE risk SET RANK = '사원' WHERE id = 'happy09';
UPDATE risk SET RANK = '과장' WHERE id = 'happy10';
UPDATE risk SET RANK = '부장' WHERE id = 'happy11';


update risk 
		set jochiPerson = 'happy07'
		where risk_no = 8
		and pcode = 9;
		
	
SELECT m.id, m.name 
FROM LESOURCE l, MEMBER m
WHERE m.id = l.id
AND l.pcode = 2;

DELETE FROM risk WHERE pcode = 26 AND risk_no = 33;

SELECT * FROM risk;

SAVEPOINT p1;
DELETE FROM risk WHERE NOT pcode = 2;

DELETE FROM RISKJOCHI;

select * from
		( select rownum as no, b.*, d.name AS dname, p.pname from 
		( select a.risk_name, a.risk_status, a.risk_reg, a.risk_no
			from risk a
			where a.risk_name like '%'||'' ||'%'
			order by risk_reg DESC
		) b, risk r, MEMBER d, project p
		 WHERE r.id = d.id
		 AND p.pcode = r.pcode
		 and d.name LIKE '%'||''|| '%'
		)
		where no between 1 and 10;

	
SELECT m.name FROM risk r, MEMBER m
WHERE m.id = r.id;

DELETE FROM risk WHERE risk_no = 18;

UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 19;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 20;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 22;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 21;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 37;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 38;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 39;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 40;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 41;
UPDATE risk SET risk_upt = risk_reg WHERE risk_no = 42;


select * from
		( select rownum as no, b.*, d.name as m_name, p.pname from 
		( select risk_name, risk_status, risk_reg, risk_upt, risk_no
			from risk 
			where risk_name like '%'||''||'%'
			order by risk_reg DESC
		) b, risk r, MEMBER d, project p
		 WHERE r.id = d.id
		 and r.pcode = p.pcode
		 and d.name LIKE '%'||''|| '%' 
		 )
		where no between 1 and 11;

SELECT p.pname, r.risk_name, r.risk_no, r.risk_status, m.name,  r.risk_reg, nvl(r2.RISK_JOCHIUPT,'-')  FROM project p, LESOURCE l, risk r, RISKJOCHI r2, MEMBER m
WHERE p.pcode = l.PCODE AND r.risk_no = r2.risk_no 
AND p.pcode = r.pcode AND r.id = m.id AND l.id = 'happy02';

SELECT * FROM 
(SELECT rownum AS NO, a.* FROM 
(SELECT p.pname, r.risk_name, r.risk_no, r.risk_status, nvl(to_char(r.risk_reg,'yyyy-mm-dd'),'-') AS risk_reg, nvl(to_char(r2.RISK_JOCHIUPT,'yyyy-mm-dd'), '-') AS risk_upt, m.name AS m_name
FROM LESOURCE l , PROJECT p, RISK r, RISKJOCHI r2, MEMBER m 
WHERE p.PCODE = l.PCODE 
AND p.pcode = r.PCODE 
AND r.risk_no = r2.risk_no(+)
AND r.id = m.id
AND l.id = 'happy02'
ORDER BY risk_reg DESC ) a
WHERE risk_name like '%'||''||'%'
AND m_name LIKE '%'||''|| '%'
)
WHERE NO BETWEEN 1 AND 20;


SELECT count(*) FROM 
			(SELECT p.pname, r.risk_name, r.risk_no, r.risk_status, to_char(r.risk_reg,'yyyy-mm-dd') AS risk_reg, nvl(to_char(r2.RISK_JOCHIUPT,'yyyy-mm-dd'), '-') AS risk_upt, m.name 
			FROM LESOURCE l , PROJECT p, RISK r, RISKJOCHI r2, MEMBER m 
			WHERE p.PCODE = l.PCODE 
			AND p.pcode = r.PCODE 
			AND r.risk_no = r2.risk_no(+)
			AND r.id = m.id
			AND l.id = 'happy02'
			ORDER BY risk_reg DESC ) a
			WHERE risk_name like '%'||''||'%'
			AND name LIKE '%'||''|| '%';

SELECT to_char(sysdate,'yyyy-mm-dd') FROM dual;

select p.pname from project p, LESOURCE l
		where p.id = 'happy02'
		AND l.pcode = p.pcode;
		
	
SELECT pcode, m.id, name FROM LESOURCE l ,MEMBER m
WHERE l.id = m.id 
AND l.pcode = 2;

select p.pname, p.pcode from project p, LESOURCE l
		where l.id = 'happy02'
		and l.pcode = p.pcode;
		
SELECT m.id, m.name 
		FROM LESOURCE l, MEMBER m
		WHERE m.id = l.id
			AND l.pcode = 42;
			
DELETE FROM risk WHERE JOCHIPERSON = ',2';
DELETE FROM risk WHERE JOCHIPERSON = ',happy05';

SELECT m.id, m.name 
		FROM LESOURCE l, MEMBER m
		WHERE m.id = l.id
			AND l.pcode = 42;

update risk 
		set jochiPerson = 'happy07'
		where risk_no = 57
		and pcode = 2;