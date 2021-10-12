package sopms.projectStatus.dao;

import java.util.ArrayList;

import sopms.vo.Project;

//프로젝트 요약정보 탭 Dao
public interface ProjectStatusSumDao {
	Project projectInfo(int pcode);
	ArrayList<String> projectDeptList(int pcode);
}
