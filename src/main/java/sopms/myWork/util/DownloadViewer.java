package sopms.myWork.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
//board.util.DownloadViewer
public class DownloadViewer extends AbstractView{

	@Value("${upload}")
	private String upload;
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		String fname = (String)model.get("downloadFile");
		// 	 	1) 파일을 객체로 생성 처리하여, 전달 준비.
		File file = new File(upload+fname);
		System.out.println("## viewer오신 것을 환영합니다##");
		System.out.println("전체파일명:"+file.getPath());
		System.out.println("파일명:"+file.getName());
		System.out.println("파일길이:"+(int)file.length());
		response.setContentType("application/download; charset=UTF-8");
		response.setContentLength((int)file.length());
		fname = URLEncoder.encode(fname,"utf-8").replaceAll("\\+", " ");
		response.setHeader("Content-Disposition",
				"attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		FileInputStream fis = new FileInputStream(file);
		
		OutputStream out = response.getOutputStream();
		FileCopyUtils.copy(fis, out);
		out.flush();
//		springweb.z02.util.DownloadViewer
	}
	
	
}