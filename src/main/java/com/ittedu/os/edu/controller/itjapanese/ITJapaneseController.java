package com.ittedu.os.edu.controller.itjapanese;

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
import com.ittedu.os.edu.entity.itJapanese.ITJapaneseWords;
import com.ittedu.os.edu.entity.itJapanese.QueryITJapanese;
import com.ittedu.os.edu.entity.subject.QuerySubject;
import com.ittedu.os.edu.entity.subject.Subject;
import com.ittedu.os.edu.service.itJapanese.ITJapaneseService;
import com.ittedu.os.edu.service.subject.SubjectService;

/**
 * IT日本語
 * @author www.ittedu.com
 */
@Controller
public class ITJapaneseController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(ITJapaneseController.class);

	@Autowired
	private SubjectService subjectService;
	@Autowired
	private ITJapaneseService iTJapaneseService;

	// 绑定属性 封装参数
	@InitBinder("queryITJapanese")
	public void initQueryITJapanese(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("queryITJapanese.");
	}

	/**
	 * IT日语
	 */
	@RequestMapping("/front/itJapanese")
	public ModelAndView downloadlist(HttpServletRequest request, @ModelAttribute("queryITJapanese") QueryITJapanese queryITJapanese, @ModelAttribute("page") PageEntity page) {
		//单词列表
		ModelAndView model = new ModelAndView(getViewPath("/web/itJapanese/it_Japanese"));
		try {
			// 教师分类
			QuerySubject querySubject = new QuerySubject();
			querySubject.setParentId(0);
			List<Subject> subjectList = subjectService.getITJapaneseSubjectList(querySubject);
			model.addObject("subjectList", subjectList);
			// 页面传来的数据放到page中
			page.setPageSize(30);
			// 查询老师
			List<ITJapaneseWords> iTJapaneseWordsList = iTJapaneseService.queryITJapaneseWordsPage(queryITJapanese, page);
			model.addObject("iTJapaneseWordsList", iTJapaneseWordsList);
			model.addObject("page", page);
			model.addObject("subjectId", queryITJapanese.getSubjectId());// 所属分类
		} catch (Exception e) {
			model.setViewName(this.setExceptionRequest(request, e));
			logger.error("iTJapaneseWordsList()--error", e);
		}
		return model;
	}

}