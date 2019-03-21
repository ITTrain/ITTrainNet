package com.ittedu.os.edu.controller.download;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ittedu.os.common.controller.BaseController;
import com.ittedu.os.common.entity.PageEntity;
import com.ittedu.os.edu.entity.download.DownloadFile;
import com.ittedu.os.edu.entity.download.QueryDownloadFile;
import com.ittedu.os.edu.entity.subject.QuerySubject;
import com.ittedu.os.edu.entity.subject.Subject;
import com.ittedu.os.edu.service.download.DownloadService;
import com.ittedu.os.edu.service.subject.SubjectService;

/**
 * 文件下载
 * @author www.ittedu.com
 */
@Controller
public class DownloadController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);

	@Autowired
	private DownloadService downloadService;
	@Autowired
	private SubjectService subjectService;

	// 绑定属性 封装参数
	@InitBinder("queryDownloadFile")
	public void initQueryDownloadFile(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("queryDownloadFile.");
	}

	/**
	 * 下载列表展示
	 */
	@RequestMapping("/front/downloadlist")
	public ModelAndView downloadlist(HttpServletRequest request, @ModelAttribute("queryDownloadFile") QueryDownloadFile queryDownloadFile, @ModelAttribute("page") PageEntity page) {
		//教师列表
		ModelAndView model = new ModelAndView(getViewPath("/web/download/download_list"));
		try {
			// 教师分类
			QuerySubject querySubject = new QuerySubject();
			querySubject.setParentId(0);
			List<Subject> subjectList = subjectService.getDownloadSubjectList(querySubject);
			model.addObject("subjectList", subjectList);
			// 页面传来的数据放到page中
			page.setPageSize(100);
			// 查询老师
			List<DownloadFile> downloadFileList = downloadService.queryDownloadListPage(queryDownloadFile, page);
			model.addObject("downloadFileList", downloadFileList);
			model.addObject("page", page);
			model.addObject("subjectId", queryDownloadFile.getSubjectId());// 下载文件的所属分类
		} catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("downloadFileList()--error", e);
		}
		return model;
	}

}