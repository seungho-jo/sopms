package sopms.projectStatus.dao;

import java.util.ArrayList;

import sopms.vo.ProjectSum;

//프로젝트 요약정보 탭 Dao
public interface ProjectStatusSumDao {
	ProjectSum projectInfo(int pcode);
	ArrayList<String> projectDeptList(int pcode);
}
