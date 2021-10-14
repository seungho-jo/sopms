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
	

/* 리스크 조치 */
CREATE TABLE Risk_Response (
	risk_no VARCHAR2(15), /* 리스크번호 */
	response_content VARCHAR2(1000), /* 리스크조치내용 */
	response_upt DATE, /* 리스크조치일 */
	id VARCHAR2(60)  /* 아이디(사원번호) */
);

SELECT * FROM risk_response;

/*제약조건 foreign_key member id -> risk_Resonse id, risk risk_no => risk_Response risk_no*/

ALTER TABLE RISK_RESPONSE
	ADD 
		CONSTRAINTS risk_Response_to_risk
		FOREIGN KEY (risk_no) REFERENCES risk(risk_no);

ALTER TABLE RISK_RESPONSE
	ADD 	
		CONSTRAINTS risk_Response_to_member
		FOREIGN KEY (id) REFERENCES MEMBER(id);
		

/* 리스크 댓글 */
CREATE TABLE Risk_Comment (
	risk_no VARCHAR2(15), /* 리스크번호 */
	comment_content VARCHAR2(1000), /* 댓글내용 */
	id varchar2(60)/* 아이디(사원번호) */
);

ALTER TABLE Risk_Comment
	ADD 
		CONSTRAINTS Risk_Comment_to_risk
		FOREIGN KEY (risk_no) REFERENCES risk(risk_no);

ALTER TABLE Risk_Comment
	ADD 
		CONSTRAINTS Risk_Comment_to_member
		FOREIGN KEY (id) REFERENCES MEMBER(id);

SELECT * FROM Risk_Comment;


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