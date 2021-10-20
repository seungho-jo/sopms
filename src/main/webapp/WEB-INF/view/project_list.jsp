<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="sopms.Management.dao.managementDao">
	
	<select id="projectList" parameterType="project_Lp" resultType="project_List">
		select * from(
		select rownum as NO, a.*, NVL(b.risk_cnt,0) AS risk_cnt FROM project a,
		(SELECT a.pcode, count(*) AS risk_cnt FROM project a, risk b
		WHERE a.PCODE = b.PCODE 
		AND a.id = #{pm}
		GROUP BY a.pcode) b
		WHERE a.PCODE = b.PCODE(+)
		AND a.id = #{pm})
		where no between #{start} and #{end}	
	</select>
	
	<select id="projectCount" parameterType="String" resultType="int">
		select count(*) from project
		where id = #{pm}
	</select>
	
	<select id="wbslist" resultType="work">
		select * from(
		select a.workcode, a.title, a.content, to_char(a.start_date,'dd-mm-YYYY') as start_date, a.duration, a.manager, a.parent, b.name as pm_name from wbs a, member b
		where a.manager = b.id OR (a.pm = b.id AND a.MANAGER IS NULL)
		)
		where workcode = #{no} or parent = #{no}
		
		
	</select>
	<update id="updateWbs" parameterType="work">
		UPDATE wbs
		   SET title = #{title},
		   	   content = #{content},
		   	   start_date = to_date(#{start_date},'YYYY-MM-DD'),
		   	   end_date = to_date(#{start_date},'YYYY-MM-DD') + #{duration},
		   	   duration = #{duration},
		       manager = #{manager},
		   	   parent = #{parent}
		 WHERE workcode = #{workcode}
 	</update>
 	
 	<update id="updateCal" parameterType="work">
		UPDATE calendar
		   SET title = #{title},
		   	   content = #{content},
		   	   start1 = to_char(to_date(#{start_date},'YYYY-MM-DD'),'YYYY-MM-DD"T"HH24:MI:SS".000Z"'),
		   	   end1 = to_char(to_date(#{start_date},'YYYY-MM-DD') + #{duration},'YYYY-MM-DD"T"HH24:MI:SS".000Z"'),
		       manager = #{manager},
		   	   parent = #{parent}
		 WHERE workcode = #{workcode}
 	</update>
 	
 	<insert id="insertWbs" parameterType="work">
		insert into wbs(workcode, title, content, start_date, end_date, duration, pm, manager, parent, status) 
		values(wbs02_seq.nextval,#{title},#{content},to_date(#{start_date},'YYYY-MM-DD'),
						to_date(#{start_date},'YYYY-MM-DD') + #{duration},#{duration},#{pm},#{manager},#{parent},'진행중')
	</insert> 
	
	<insert id="insertCal" parameterType="work">
		insert into calendar values(cal_seq.nextval,wbs02_seq.currval,#{title},#{content},to_char(to_date(#{start_date},'YYYY-MM-DD'),'YYYY-MM-DD"T"HH24:MI:SS".000Z"'), 
						to_char(to_date(#{start_date},'YYYY-MM-DD') + #{duration},'YYYY-MM-DD"T"HH24:MI:SS".000Z"'),
						1, '#6633FF', '#6633FF', '#FFFFFF',#{pm},#{manager},#{parent},null,'진행중')
	</insert> 
	
  	<delete id="deleteWbs" parameterType="int">
		DELETE FROM wbs
		 WHERE workcode = #{workcode}
 	</delete> 
 	
 	<delete id="deleteCal" parameterType="int">
		DELETE FROM calendar
		 WHERE workcode = #{workcode}
 	</delete>	
 	
 	<select id="resourcelist" resultType="user" parameterType="String">
	<!-- 이름, 부서, 직급, 투입날짜 -->
	SELECT mem.id,mem.name
	FROM lesource le,MEMBER mem
	WHERE le.id = mem.id AND pcode= #{pcode}
	</select>
	
	
</mapper>